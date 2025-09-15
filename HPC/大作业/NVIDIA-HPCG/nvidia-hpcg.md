### 1. 首先下载github上的nvidia-hpcg仓库
```
git clone https://github.com/NVIDIA/nvidia-hpcg
```
### 2. 修改build_sample.sh
MPI_PATH, CUDA_PATH, MATHLIBS_PATH, NCCL_PATH, NVPL_SPARSE_PATH这几个环境变量。但是其实因为集群自带了cuda toolkits，所以只要写一个CUDA_PATH，之后它的include和lib64文件夹内就有include库和动态链接文件了。这里由于我最开始认为集群没有nccl，所以nccl是spack下载的，所以我不确定nccl是否也在上述cuda toolkits中。          
由于我们的V100集群是x86+sm70的，所以USE_GRACE置0，其他选项都保留1即可。
### 3. 修改Make.CUDA_X86
由于我们的机器是sm70的，而这个nvidia-hpcg默认是为80 90 100三个架构的机器构建代码，所以我们要把其中一个改为70，将sm_80和compute_80中的80改为70即可
### 4. 修改run_sample.sh
这里同样要将动态库文件路径放上来，否则运行会报错找不到动态库文件。        
这里run_sample.sh给出了两种架构上运行的代码，只有第一个mpirun是x86架构的，其他都是aarch64，也就是arm架构的，不再测试，所以都注释掉吧。
### 5. 运行代码
这里我尝试过sbatch，但是发现V100最多只给申请1个节点两块卡，所以我就直接salloc了。      
```
salloc --gpus=2 -p V100
```
然后就可以调整run_sample.sh中的-np参数了。
然后只要加个权限，就可以直接运行了.
```
chmod +x ./build_sample.sh
chmod +x ./run_sample.sh
```
```
./run_sample.sh
```
### 6. 其他修改
如果要使用clang编译.cu文件，则在Make.CUDA_X86文件里要把CXX和CXXFLAGS替换为
```
CXX          = clang++
CXXFLAGS = $(HPCG_DEFS) -std=c++17 -O3 -fopenmp -march=$(CPU_ARCH) -mtune=$(CPU_ARCH) -fvectorize -funroll-loops -DTHRUST_PROVIDE_LEGACY_ARCH_MACROS=1 -lcudart
```
需要加一个-lcudart，因为clang默认不编译cudaMemcpy这一类函数，会报错没有这个函数，这个标签可以让clang去寻找链接这几个函数的库。
但是比较意外的是，和网络上说的clang会带来提速不一样，我用clang编译反而计算性能下降了(Gflops下降了约40%)
值得一提的是，输入参数可以直接通过-nx -ny -nz指定，hpcg.sh脚本会接受这几个参数然后作为指定问题规模，否则会读取./bin/sample-dat/hpcg.dat中的数据文件。
其他的修改只要在Make.CUDA_X86中直接修改即可。