#!/bin/bash
#SBATCH --nodes=8
#SBATCH --cpus-per-task=40
#SBATCH --time=24:00:00
#SBATCH --job-name tri_p4

module load NiaEnv/2019b 
cd /scratch/z/zingg/tmontoya/TensorSimplexTests/scripts/fast
export OPENBLAS_NUM_THREADS=1

timeout 1410m srun -N 1 -n 1 -c 40 julia --project=../.. --threads 40 --check-bounds=no tri_multi/advtrimm4c.jl &
timeout 1410m srun -N 1 -n 1 -c 40 julia --project=../.. --threads 40 --check-bounds=no tri_multi/advtrimm4u.jl &
timeout 1410m srun -N 1 -n 1 -c 40 julia --project=../.. --threads 40 --check-bounds=no tri_multi/advtrinm4c.jl &
timeout 1410m srun -N 1 -n 1 -c 40 julia --project=../.. --threads 40 --check-bounds=no tri_multi/advtrinm4u.jl &
timeout 1410m srun -N 1 -n 1 -c 40 julia --project=../.. --threads 40 --check-bounds=no tri_tensor/advtrimt4c.jl &
timeout 1410m srun -N 1 -n 1 -c 40 julia --project=../.. --threads 40 --check-bounds=no tri_tensor/advtrimt4u.jl &
timeout 1410m srun -N 1 -n 1 -c 40 julia --project=../.. --threads 40 --check-bounds=no tri_tensor/advtrint4c.jl &
timeout 1410m srun -N 1 -n 1 -c 40 julia --project=../.. --threads 40 --check-bounds=no tri_tensor/advtrint4u.jl &
wait

num=$NUM
if [ "$num" -lt 5 ]; then
      num=$(($num+1))
      ssh -t nia-login01 "cd $SLURM_SUBMIT_DIR; sbatch --export=NUM=$num /scratch/z/zingg/tmontoya/TensorSimplexTests/scripts/fast/advection_refinement_tri_p4.sh";
fi