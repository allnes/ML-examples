export BASEDIR=/mnt/v399/source/armnn-tflite
export ARMNN_ROOT=$BASEDIR/armnn
export BOOST_ROOT=$BASEDIR/boost
export ARMNN_BUILD=$BASEDIR/armnn/build
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BASEDIR/armnn/build
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BASEDIR/protobuf-arm
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BASEDIR/protobuf-host
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BASEDIR/tensorflow-protobuf
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BASEDIR/flatbuffers-arm32


# MobileNet_v1_1.0_224_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_1.0_224_quant/mobilenet_v1_1.0_224_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 224 -c CpuAcc

# MobileNet_v1_0.75_224_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_0.75_224_quant/mobilenet_v1_0.75_224_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 224 -c CpuAcc

# MobileNet_v1_0.5_224_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_0.5_224_quant/mobilenet_v1_0.5_224_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 224 -c CpuAcc

# MobileNet_v1_0.25_224_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_0.25_224_quant/mobilenet_v1_0.25_224_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 224 -c CpuAcc

# MobileNet_v1_1.0_192_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_1.0_192_quant/mobilenet_v1_1.0_192_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 192 -c CpuAcc

# MobileNet_v1_0.75_192_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_0.75_192_quant/mobilenet_v1_0.75_192_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 192 -c CpuAcc

# MobileNet_v1_0.5_192_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_0.5_192_quant/mobilenet_v1_0.5_192_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 192 -c CpuAcc

# MobileNet_v1_0.25_192_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_0.25_192_quant/mobilenet_v1_0.25_192_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 192 -c CpuAcc

# MobileNet_v1_1.0_160_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_1.0_160_quant/mobilenet_v1_1.0_160_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 160 -c CpuAcc

# MobileNet_v1_0.75_160_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_0.75_160_quant/mobilenet_v1_0.75_160_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 160 -c CpuAcc

# MobileNet_v1_0.5_160_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_0.5_160_quant/mobilenet_v1_0.5_160_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 160 -c CpuAcc

# MobileNet_v1_0.25_160_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_0.25_160_quant/mobilenet_v1_0.25_160_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 160 -c CpuAcc

# MobileNet_v1_1.0_128_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_1.0_128_quant/mobilenet_v1_1.0_128_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 128 -c CpuAcc

# MobileNet_v1_0.75_128_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_0.75_128_quant/mobilenet_v1_0.75_128_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 128 -c CpuAcc

# MobileNet_v1_0.5_128_quant

# ./mobilenetv1_quant_tflite \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_0.5_128_quant/mobilenet_v1_0.5_128_quant.tflite \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 128 -c CpuAcc

# MobileNet_v1_0.25_128_quant

./mobilenetv1_quant_tflite \
--model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_0.25_128_quant/mobilenet_v1_0.25_128_quant.tflite \
--data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
--model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
--size 128 -c CpuAcc

# MobileNet_v1_1.0_224

# ./mobilenetv1_tf \
# --model-path /home/anesterov/Documents/source/ML-examples/armnn-mobilenet-quant/models/mobilenet_v1_1.0_224/mobilenet_v1_1.0_224_frozen.pb \
# --data-dir /mnt/v399/source/ComputeLibrary/data/images/ILSVRC2012_val_00033421.JPEG \
# --model-output-labels /mnt/v399/source/ComputeLibrary/data/imagenet1000_clsidx_to_labels.txt \
# --size 224 -c CpuAcc