#!/bin/bash

# 先加载 spack 再加载编译环境
# e.g. 
# source ${HOME}/spack/share/spack/setup-env.sh
# spack load intel-oneapi-compilers

# 运行你的命令
#source ~/spack/share/spack/setup-env.sh
source /pxe/opt/spack/share/spack/setup-env.sh
# 加载你需要的环境，如:
spack load intel-oneapi-mpi intel-oneapi-compilers
cmake -B build
cmake --build build
