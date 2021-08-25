#!/bin/bash
#SBATCH -J JOBNAME                      # Job name
#SBATCH -o JOB_%A_%a.out                # Name of stdout output log file (%j expands to jobID)
#SBATCH -e JOB_%A_%a.err                # Name of stderr output log file (%j expands to jobID)
#SBATCH -N 1                            # Total number of nodes requested
#SBATCH -n 1                            # Total number of cores requested
#SBATCH --mem=50000                     # Total amount of (real) memory requested (per node)
#SBATCH -t DD-HH:MM:SS                  # Time limit (hh:mm:ss)
#SBATCH --partition=GROUPNAME           # Request partition for resource allocation
#SBATCH --gres=gpu:1                    # Specify a list of generic consumable resources (per node)
#SBATCH --array 0-4,10-14,20-24,30-34,40-44

# These lines activate your conda environment for the job
# Replace CONDA_ENV_NAME with your environment name
eval "$(conda shell.bash hook)"
conda activate CONDA_ENV_NAME

# Template SLURM script which adapts 25 models to the
#   Wikitext-2 validation partition while outputting word-level
#   complexity measures (like surprisal)
#   Pre-trained models from
#   van Schijndel et al (2019) https://zenodo.org/record/3559340
# Shows how to use SLURM arrays to dynamically determine job parameters

### JOB-SPECIFIC VARS 1
### (there's another set just before the main command at the bottom)

DATA_DIR=./data/wikitext-2
TEST_FNAME=test.txt

##### Dynamic job specs based on array index 

TOKEN_ARRAY=(2m 10m 20m 40m 80m)
PARTITION_ARRAY=(a b c d e)

# Use a digit coding scheme to assign values based on job array index 
#   To get X of XYZ: $(($SLURM_ARRAY_TASK_ID / X00))
#   To get Y of XYZ: $((($SLURM_ARRAY_TASK_ID % X00) / Y0))
#   To get Z of XYZ: $(($SLURM_ARRAY_TASK_ID % Y0))
# Note that this can lead to annoying manual array specification in the header,
#   which can be generated easily from a quick external python script or something

# Partition is indexed from the 10s digit using 3-digit indices
#PARTITION_INDEX=$((($SLURM_ARRAY_TASK_ID % 100) / 10))
# Partition is indexed from the 10s digit using 2-digit indices
PARTITION_INDEX=$(($SLURM_ARRAY_TASK_ID / 10))
PARTITION=${PARTITION_ARRAY[${PARTITION_INDEX}]}

# Token is indexed from the 1s digit using N-digit indices
TOKENS=${TOKEN_ARRAY[$(($SLURM_ARRAY_TASK_ID % 10))]}

# You can add bash logic based on the array index
if [ $(($SLURM_ARRAY_TASK_ID % 10)) -lt 3 ]; then
    SEED=0
elif [ $TOKENS == 40m ]; then
    SEED=$((10 + $PARTITION_INDEX))
else
    SEED=$((70 + $PARTITION_INDEX))
fi

MODEL_FILE=LSTM_400_${TOKENS}_${PARTITION}_${SEED}-d0.2.pt

### JOB-SPECIFIC VARS 2
### User may want to modify this a bit more
ADAPTED_MODEL=${MODEL_FILE}.adapted

#####

time python main.py --model_file ${MODEL_FILE} --vocab_file vocab.txt --cuda --data_dir ${DATA_DIR} --testfname ${TEST_FNAME} --adapted_model ${ADAPTED_MODEL} --lowercase --adapt --words
