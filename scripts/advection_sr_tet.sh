#!/bin/bash
#SBATCH --nodes=8
#SBATCH --cpus-per-task=40
#SBATCH --time=6:00
#SBATCH --job-name tet_sr

module load NiaEnv/2019b 
cd /scratch/z/zingg/tmontoya/v2/TensorSimplexTests/scripts
export OPENBLAS_NUM_THREADS=40

timeout 345m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no --tet_sr/sr_mmc.jl &
timeout 345m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no --tet_sr/sr_mmu.jl &
timeout 345m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no --tet_sr/sr_nmc.jl &
timeout 345m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no --tet_sr/sr_nmu.jl &
timeout 345m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no --tet_sr/sr_mtc.jl &
timeout 345m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no --tet_sr/sr_mtu.jl &
timeout 345m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no --tet_sr/sr_ntc.jl &
timeout 345m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no --tet_sr/sr_ntu.jl &
wait

num=$NUM
if [ "$num" -lt 5 ]; then
      num=$(($num+1))
      ssh -t nia-login01 "cd $SLURM_SUBMIT_DIR; sbatch --export=NUM=$num /scratch/z/zingg/tmontoya/v2/TensorSimplexTests/scripts/advection_sr_tet.sh";
fi