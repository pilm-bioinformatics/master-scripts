#!/bin/bash
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=4000
#SBATCH -t 0-46:00:00
#SBATCH -J "rnafusion"
#SBATCH -e job.e
#SBATCH -o job.o
## SBATCH --mail-type=END,FAIL # this line is commented
## SBATCH --mail-user=user@mit.edu  # this line is commented

export PATH=/om2/group/pilm/conda3/envs/nf-core-rnafusion-1.0.2/bin:$PATH
export PATH=/om2/group/pilm/bin:$PATH

if [ ! -f "om-profile.config" ] ; then
  cp  /om2/group/pilm/master-scripts/config/om-profile.config .
fi

## Example pipeline
GENOME=/om/group/pilm/genomes/Hsapiens/hg38/hg38.config
## change the path to point your reads
nextflow run /om2/group/pilm/pipelines/rnafusion -c om-profile.config  --reads "/om/group/pilm/test_data/mouse/*_E12.5_{1,2}.fastq.gz" --star_fusion  --ericscript  -c $GENOME -resume 
