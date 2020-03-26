OPENCV_URL=https://paddleseg.bj.bcebos.com/deploy/deps/opencv341.tar.bz2
if [ ! -d "./deps/opencv341" ]; then
    mkdir -p deps
    cd deps
    wget -c ${OPENCV_URL}
    tar xvfj opencv341.tar.bz2
    rm -rf opencv341.tar.bz2
    cd ..
fi

WITH_GPU=OFF
PADDLE_DIR=/root/projects/deps/fluid_inference/
CUDA_LIB=/usr/local/cuda-10.0/lib64/
CUDNN_LIB=/usr/local/cuda-10.0/lib64/
OPENCV_DIR=$(pwd)/deps/opencv341/

rm -rf build
mkdir -p build
cd build

cmake .. \
    -DWITH_GPU=${WITH_GPU} \
    -DPADDLE_DIR=${PADDLE_DIR} \
    -DCUDA_LIB=${CUDA_LIB} \
    -DCUDNN_LIB=${CUDNN_LIB} \
    -DOPENCV_DIR=${OPENCV_DIR} \
    -DWITH_STATIC_LIB=OFF
make clean
make -j12