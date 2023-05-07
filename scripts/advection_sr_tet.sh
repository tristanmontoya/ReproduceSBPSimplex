#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --time=24:00:00
#SBATCH --job-name sr_tet

module load NiaEnv/2019b 
cd /scratch/z/zingg/tmontoya/TensorSimplexTests/scripts
export OPENBLAS_NUM_THREADS=40

#timeout 355m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no sr_tet/sr_mmc.jl &
#timeout 355m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no sr_tet/sr_mmu.jl &
#timeout 355m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no sr_tet/sr_nmc.jl &
#timeout 355m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no sr_tet/sr_nmu.jl &
julia --project=.. --threads 1 sr_tet_new/sr_mtc.jl &
julia --project=.. --threads 1 sr_tet_new/sr_mtu.jl &
julia --project=.. --threads 1 sr_tet_new/sr_ntc.jl &
julia --project=.. --threads 1 sr_tet_new/sr_ntu.jl &
wait
