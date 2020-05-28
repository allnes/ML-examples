//
// Copyright © 2017 Arm Ltd. All rights reserved.
// SPDX-License-Identifier: MIT
//

#include "model_output_labels_loader.hpp"
#include "inference_test_image.hpp"
#include "utils.hpp"

#include <armnn/BackendId.hpp>
#include <armnn/IRuntime.hpp>
#include <armnn/Utils.hpp>
#include <armnn/BackendRegistry.hpp>

#include "armnnTfParser/ITfParser.hpp"

#include <boost/filesystem.hpp>
#include <boost/program_options.hpp>
#include <boost/variant.hpp>

#include <algorithm>
#include <iostream>
#include <iterator>
#include <map>
#include <string>
#include <vector>
#include <iostream>

#include <chrono>
typedef std::chrono::high_resolution_clock Time;
typedef std::chrono::nanoseconds ns;

struct ProgramOptions
{
    std::string modelPath;
    std::string imagePath;
    std::string modelOutputLabelsPath;
    unsigned int inputWidthHeight;
    std::vector<armnn::BackendId> computeDevice;
};

/** Parse and get program options from command line arguments
 *
 * @param[in] argc    Number of command line arguments
 * @param[in] argv    Array of command line arguments
 * @param[in] options Program options
 * @return Status
 */
int GetProgramOptions(int argc, char* argv[], ProgramOptions& options)
{
    namespace po = boost::program_options;
    std::vector<armnn::BackendId> defaultBackends = {armnn::Compute::CpuAcc, armnn::Compute::CpuRef};

    const std::string backendsMessage = "Which device to run layers on by default. Possible choices: "
        + armnn::BackendRegistryInstance().GetBackendIdsAsString();

    po::options_description desc("Options");

    desc.add_options()
        ("help,h", "Display help messages")
        ("model-path,m", po::value<std::string>(&options.modelPath)->required(), "Path to armnn format model file")
        ("data-dir,d", po::value<std::string>(&options.imagePath)->required(),
         "Path to directory containing the ImageNet test data")
        ("size,sz", po::value<unsigned int>(&options.inputWidthHeight)->required(),
         "Input size")
        ("model-output-labels,p", po::value<std::string>(&options.modelOutputLabelsPath)->required(),
         "Path to model output labels file.")
        ("compute,c", po::value<std::vector<armnn::BackendId>>(&options.computeDevice)->default_value(defaultBackends),
         backendsMessage.c_str());

    po::variables_map vm;
    try
    {
        po::store(po::parse_command_line(argc, argv, desc), vm);

        if (vm.count("help"))
        {
            std::cout << desc << std::endl;
            return EXIT_FAILURE;
        }
        po::notify(vm);
    }
    catch (po::error& e)
    {
        std::cerr << e.what() << std::endl << std::endl;
        std::cerr << desc << std::endl;
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}

int main(int argc, char* argv[])
{
    armnn::LogSeverity level = armnn::LogSeverity::Info;
    armnn::ConfigureLogging(true, true, level);

    const std::string inputName = "input";
    const std::string outputName = "MobilenetV1/Predictions/Reshape_1";

    // ------------------------------------------------------------------------
    // Get program options
    // ------------------------------------------------------------------------

    ProgramOptions programOptions;
    if (GetProgramOptions(argc, argv, programOptions) != 0)
    {
        return EXIT_FAILURE;
    }

    // ------------------------------------------------------------------------
    // Load model output labels
    // ------------------------------------------------------------------------

    const std::vector<CategoryNames> modelOutputLabels = LoadModelOutputLabels(programOptions.modelOutputLabelsPath);

    const unsigned int inputTensorWidth = programOptions.inputWidthHeight;
    const unsigned int inputTensorHeight = programOptions.inputWidthHeight;
    // ------------------------------------------------------------------------
    // Load and preprocess input image
    // ------------------------------------------------------------------------

    using TContainer = boost::variant<std::vector<uint8_t>>;

    // Prepare image normalization parameters
    NormalizationParameters normParams;

    normParams.scale  = 1.0;
    normParams.mean   = { 127.5, 127.5, 127.5 };
    normParams.stddev = { 127.5, 127.5, 127.5 };

    // Load and preprocess input image
    const std::vector<TContainer> inputDataContainers
    {
        PrepareImageTensor(programOptions.imagePath, inputTensorWidth, inputTensorHeight, normParams)
    };

    // ------------------------------------------------------------------------
    // Prepare output tensor
    // ------------------------------------------------------------------------
    // Output tensor size is equal to the number of model output labels
    const unsigned int outputNumElements = modelOutputLabels.size() + 1;
    std::vector<TContainer> outputDataContainers = { std::vector<uint8_t>(outputNumElements) };

    // ------------------------------------------------------------------------
    // Import graph
    // ------------------------------------------------------------------------

    // Import the TensorFlowLite model.
    using IParser = armnnTfParser::ITfParser;
    auto armnnparser(IParser::Create());
    
    armnn::INetworkPtr network = armnnparser->CreateNetworkFromBinaryFile(programOptions.modelPath.c_str(),
                                                                        { {inputName, {1, inputTensorHeight, inputTensorWidth, 3}} },
                                                                        { outputName });
    // Find the binding points for the input and output nodes
    using BindingPointInfo = armnnTfParser::BindingPointInfo;
    const std::vector<BindingPointInfo> inputBindings  = { armnnparser->GetNetworkInputBindingInfo(inputName) };
    const std::vector<BindingPointInfo> outputBindings = { armnnparser->GetNetworkOutputBindingInfo(outputName) };


    // ------------------------------------------------------------------------
    // Optimize graph and load the optimized graph onto a compute device
    // ------------------------------------------------------------------------
    // Optimize the network for a specific runtime compute device, e.g. CpuAcc, GpuAcc
    
    armnn::IRuntime::CreationOptions options;
    armnn::IRuntimePtr runtime(armnn::IRuntime::Create(options));
    armnn::IOptimizedNetworkPtr optimizedNet = armnn::Optimize(*network,
                                                               programOptions.computeDevice,
                                                               runtime->GetDeviceSpec());

    // Load the optimized network onto the runtime device

    armnn::NetworkId networkId;
    runtime->LoadNetwork(networkId, std::move(optimizedNet));

    // ------------------------------------------------------------------------
    // Run graph on device
    // ------------------------------------------------------------------------
    std::cout << "Running network..." << std::endl;
    const int NUM_ITER = 100;
    auto startTime = Time::now();
    for (int i = 0; i < NUM_ITER; i++)
    {
        runtime->EnqueueWorkload(networkId,
                                MakeInputTensors(inputBindings, inputDataContainers),
                                MakeOutputTensors(outputBindings, outputDataContainers));
    }
    auto endTime = Time::now();
    std::cout << "Average time = " << (std::chrono::duration_cast<ns>(endTime - startTime).count() * 0.000001) / NUM_ITER << " ms" << std::endl;

    // ------------------------------------------------------------------------
    // Process and report output
    // ------------------------------------------------------------------------
    std::cout << "Process and report output" << std::endl;

    std::vector<uint8_t> output = boost::get<std::vector<uint8_t>>(outputDataContainers[0]);

    size_t labelInd = std::distance(output.begin(), std::max_element(output.begin(), output.end()));
    std::cout << "Prediction: ";
    for (const auto& label : modelOutputLabels[labelInd])
    {
        std::cout << label << ", ";
    }
    std::cout << std::endl;

    std::cerr<< "Ran successfully!" << std::endl;

    return EXIT_SUCCESS;
}
