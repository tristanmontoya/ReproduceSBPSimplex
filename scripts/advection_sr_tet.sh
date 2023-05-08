#!/bin/bash
#SBATCH --nodes=4
#SBATCH --cpus-per-task=40
#SBATCH --time=12:00:00
#SBATCH --job-name sr_tet

module load NiaEnv/2019b 
cd /scratch/z/zingg/tmontoya/TensorSimplexTests/scripts
export OPENBLAS_NUM_THREADS=40

#timeout 355m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no sr_tet/sr_mmc.jl &
#timeout 355m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no sr_tet/sr_mmu.jl &
#timeout 355m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no sr_tet/sr_nmc.jl &
#timeout 355m srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no sr_tet/sr_nmu.jl &
timeout 1430 srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no sr_tet_new/sr_mtc.jl &
timeout 1430 srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no sr_tet_new/sr_mtu.jl &
timeout 1430 srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no sr_tet_new/sr_ntc.jl &
timeout 1430 srun -N 1 -n 1 -c 40 julia --project=.. --threads 1 --check-bounds=no sr_tet_new/sr_ntu.jl &
wait

num=$NUM
if [ "$num" -lt 5 ]; then
      num=$(($num+1))
      ssh -t nia-login01 "cd $SLURM_SUBMIT_DIR; sbatch --export=NUM=$num /scratch/z/zingg/tmontoya/TensorSimplexTests/scripts/advection_sr_tet.sh";
fi
