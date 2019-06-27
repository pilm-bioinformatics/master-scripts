#!/bin/bash
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=4000
#SBATCH -t 0-23:00:00
#SBATCH -J "job"
#SBATCH -e job.e
#SBATCH -o job.o
## SBATCH --mail-type=END,FAIL # this line is commented
## SBATCH --mail-user=user@mit.edu  # this line is commented


