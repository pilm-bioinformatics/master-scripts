#!/bin/bash
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=4000
#SBATCH -t 0-23:00:00
#SBATCH -J "smrnaseq"
#SBATCH -e job.e
#SBATCH -o job.o
## SBATCH --mail-type=END,FAIL # this line is commented
## SBATCH --mail-user=user@mit.edu  # this line is commented

export PATH=/om2/group/pilm/conda3/envs/nf-core-smrnaseq-1.0dev/bin:$PATH
export PATH=/om2/group/pilm/bin:$PATH

if [ ! -f "om-profile.config" ] ; then
  cp  /om2/group/pilm/master-scripts/config/om-profile.config .
fi
if [ ! -f "om-rnaseq" ] ; then
  cp  /om2/group/pilm/master-scripts/pipelines-nf-smrnaseq/om-smrnaseq.config .
fi

## Example pipeline
GENOME=/om/group/pilm/genomes/Mmusculus/GRCm38.96/GRCm38.96.config
#GENOME=/om/group/pilm/genomes/Mmusculus/GRCh38.96/GRCh38.96.config

# nextflow run /om2/group/pilm/pipelines/dev/pipelines-nf-smrnaseq -c om-profile.config -c om-srnaseq.config -c $GENOME  --reads "/om/group/pilm/test_data/mouse/*_{1,2}.fastq.gz" -resume
