#!/bin/bash
#SBATCH --job-name=solver
#SBATCH --output=run.out
#SBATCH --error=run.err
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=16
#SBATCH --time=00:2:00
#SBATCH --partition=solver2


# 对于 sbatch 脚本参数，请阅读 https://slurm.schedmd.com/sbatch.html
# ntasks-per-node 对应每个节点上的进程数
# cpus-per-task 对应每个进程的线程数

# 先加载 spack 再加载编译环境
# e.g. 
#source ${HOME}/spack/share/spack/setup-env.sh
export OMP_NUM_THREADS=8
export I_MPI_PMI_LIBRARY=/slurm/libpmi2.so.0.0.0
source /pxe/opt/spack/share/spack/setup-env.sh
spack load intel-oneapi-mpi intel-oneapi-compilers
# Run BICGSTAB
#echo $I_MPI_PMI_LIBRARY
srun --cpu-bind=none --mpi=pmi2 ./build/bicgstab $1
#echo $1
#./test