#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=40
#SBATCH --time=24:00:00
#SBATCH --job-name flop_count

module load NiaEnv/2019b 
cd /scratch/z/zingg/tmontoya/TensorSimplexTests/scripts
export OPENBLAS_NUM_THREADS=1

timeout 710m julia --project=.. --threads 8 --check-bounds=no flops_tri.jl &
timeout 710m julia --project=.. --threads 8 --check-bounds=no flops_tet.jl &
wait

num=$NUM
if [ "$num" -lt 5 ]; then
      num=$(($num+1))
      ssh -t nia-login01 "cd $SLURM_SUBMIT_DIR; sbatch --export=NUM=$num /scratch/z/zingg/tmontoya/TensorSimplexTests/scripts/flop_count.sh";
fi
