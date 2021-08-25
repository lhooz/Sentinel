#!/bin/bash --login

#$ -pe smp.pe 32
#$ -cwd

#$ -m bea
#$ -M hao.lee0019@yahoo.com

#$ -t 1-2
readarray -t JOB_DIRS < <(find . -mindepth 1 -maxdepth 1 -name 'sentinel*' -printf '%P\n')

module load apps/binapps/anaconda3/2019.07  # Python 3.7.3
module load apps/gcc/openfoam/v2012
module load apps/binapps/paraview/5.7.0
source $foamDotFile

. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions

TID=$[SGE_TASK_ID-1]
JOBDIR=${JOB_DIRS[$TID]}

cd $JOBDIR
echo "Running SGE_TASK_ID $SGE_TASK_ID in directory $JOBDIR"
sh run_all.sh
cd ..
