# G2 Cluster
We have access to the G2 Cluster at Cornell. It's great! But if you've never used a computing cluster before, it might be daunting to get started. We've all had to start somewhere. Here are some tips to get you started, and don't be afraid to ask for help as you need it.

## Setup Conda environment
In order to install and use python libraries, you should use conda
First create a new python environment:

    conda create --name CONDA_ENV_NAME python=3.9

When you want to use an environment, activate it:

    conda activate CONDA_ENV_NAME

Once activated, you can install python packages into the environment:

    conda install PACKAGENAME

Those packages are available anytime you run python while the environment is active. To activate a conda environment from an arbitrary node on the cluster, you need a little extra syntactic sugar (see [dynamic_arrays.sh](dynamic_arrays.sh)).

## Running jobs on the cluster
[Cluster help page](https://it.coecis.cornell.edu/using-the-g2-cluster)

To access the cluster, you will ssh into a gateway node. You shouldn't run code on the gateway server because the gateways are underpowered and every other person logs into the cluster through the gateway, so using up its resources running jobs will prevent others from accessing the cluster. Instead, you can either:
* Run jobs interactively using an interactive session on a compute node. This is best for testing out small bits of code and debugging. To access an interactive node run this command from the gateway:  
`srun --pty /bin/bash` (you can use `-p PARTITION` to specify a partition)
* Submit jobs to a computing cluster via a SLURM script. This is the usual way to run code on the cluster. There is a demo SLURM script that documents several aspects of SLURM, which you can adapt to your jobs in this repo: [dynamic_arrays.sh](dynamic_arrays.sh).
