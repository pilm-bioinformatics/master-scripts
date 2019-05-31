#!/bin/bash
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=4000
#SBATCH -t 0-23:00:00
#SBATCH -J "rnaseq"
#SBATCH -e job.e
#SBATCH -o job.o
## SBATCH --mail-type=END,FAIL # this line is commented
## SBATCH --mail-user=tobias.jakobi@med.uni-heidelberg.de  # this line is commented

export PATH=/om2/group/tsailab/conda3/envs/rnaseq/bin:$PATH
export PATH=/om2/group/tsailab/tools/bin:$PATH

if [ ! -f "om-profile.config" ] ; then
  https://github.com/pilm-bioinformatics/master-scripts/raw/master/config/om-profile.config
fi

# Add --singleEnd if true
nextflow run pilm-bioinformatics/pipelines-nf-rnaseq -c om-profile.config -profile om --reads data/*R{1,2}gz --genome GRCh38  -with-report process.html -with-timeline time.html -resume 
