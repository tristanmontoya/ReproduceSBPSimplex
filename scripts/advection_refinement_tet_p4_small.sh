#!/bin/bash
#SBATCH --nodes=8
#SBATCH --cpus-per-task=40
#SBATCH --time=24:00:00
#SBATCH --job-name tet_p4_small

module load NiaEnv/2019b 
cd /scratch/z/zingg/tmontoya/TensorSimplexTests/scripts
export OPENBLAS_NUM_THREADS=1

timeout 1430m srun -N 1 -n 1 -c 40 julia --project=.. --threads 40 --check-bounds=no tet_multi_small_step/advtetmm4c.jl &
timeout 1430m srun -N 1 -n 1 -c 40 julia --project=.. --threads 40 --check-bounds=no tet_multi_small_step/advtetmm4u.jl &
timeout 1430m srun -N 1 -n 1 -c 40 julia --project=.. --threads 40 --check-bounds=no tet_multi_small_step/advtetnm4c.jl &
timeout 1430m srun -N 1 -n 1 -c 40 julia --project=.. --threads 40 --check-bounds=no tet_multi_small_step/advtetnm4u.jl &
timeout 1430m srun -N 1 -n 1 -c 40 julia --project=.. --threads 40 --check-bounds=no tet_tensor_small_step/advtetmt4c.jl &
timeout 1430m srun -N 1 -n 1 -c 40 julia --project=.. --threads 40 --check-bounds=no tet_tensor_small_step/advtetmt4u.jl &
timeout 1430m srun -N 1 -n 1 -c 40 julia --project=.. --threads 40 --check-bounds=no tet_tensor_small_step/advtetnt4c.jl &
timeout 1430m srun -N 1 -n 1 -c 40 julia --project=.. --threads 40 --check-bounds=no tet_tensor_small_step/advtetnt4u.jl &
wait

num=$NUM
if [ "$num" -lt 10 ]; then
      num=$(($num+1))
      ssh -t nia-login01 "cd $SLURM_SUBMIT_DIR; sbatch --export=NUM=$num /scratch/z/zingg/tmontoya/TensorSimplexTests/scripts/advection_refinement_tet_p4_small.sh";
fi
