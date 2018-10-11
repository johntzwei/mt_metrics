#!/bin/bash
#
#SBATCH --job-name=amr-parse
#SBATCH --nodes=1
#SBATCH --mem=8G
#SBATCH --time=20:00:00
#SBATCH --partition=titanx-long
#SBATCH --gres=gpu:1
#SBATCH --output=slurm/logs/parse_%A.out
#SBATCH --error=slurm/logs/parse_%A.err

module load torch7/7.0

module use $MODULEFILES
module load java1.8.0

cd $NEURAL_AMR_ROOT
./parse_amr.sh $INPUT text
