# G2-SLURM
SLURM scripts for the G2 cluster

### Setup Conda environment
In order to install an use python libraries, you should use conda
First create a new python environment:

    conda create --name CONDA_ENV_NAME python=3.9

When you want to use an environment, activate it:

    conda activate CONDA_ENV_NAME

Once activated, you can install python packages into the environment:

    conda install PACKAGENAME

Those packages are available anytime you run python while the environment is active. To activate a conda environment from an arbitrary node on the cluster, you need a little extra syntactic sugar (see `dynamic_arrays.sh`). 