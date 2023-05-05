#!/bin/bash
#SBATCH --nodes=2
#SBATCH --cpus-per-task=40
#SBATCH --time=24:00:00
#SBATCH --job-name tet_prefine

module load NiaEnv/2019b 
cd /scratch/z/zingg/tmontoya/TensorSimplexTests/scripts
export OPENBLAS_NUM_THREADS=1

#timeout 1410m srun -N 1 -n 1 -c 40 julia --project=.. --threads 40 --check-bounds=no p_refine_tet/advtetnmuM2.jl &
#timeout 1410m srun -N 1 -n 1 -c 40 julia --project=.. --threads 40 --check-bounds=no p_refine_tet/advtetnmcM2.jl &
timeout 1430m srun -N 1 -n 1 -c 40 julia --project=.. --threads 40 --check-bounds=no p_refine_tet_16up/advtetmtuM2.jl &
timeout 1430m srun -N 1 -n 1 -c 40 julia --project=.. --threads 40 --check-bounds=no p_refine_tet_16up/advtetmtcM2.jl &
wait

num=$NUM
if [ "$num" -lt 5 ]; then
      num=$(($num+1))
      ssh -t nia-login01 "cd $SLURM_SUBMIT_DIR; sbatch --export=NUM=$num /scratch/z/zingg/tmontoya/TensorSimplexTests/scripts/advection_p_refine_tet_M2.sh";
fi
