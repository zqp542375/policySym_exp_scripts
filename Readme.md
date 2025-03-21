### RQ3  Artifact
[PolicySym](https://github.com/zqp542375/policySym) is a guided symbolic execution framework for security analysis of Solidity smart contracts. 

This repository is for reproducing the experiments.


### Structure
The experiments are set up in a containerized environment. This repository provides the necessary scripts and data to build the Docker-based container environment. Given a set of contracts, we divide them into groups. Each group consists of Solidity files and a csv file listing the information of the contracts in the Solidity files. A contract group is assigned to a Docker container, in which the contracts are evaluated. 



### Requirements
      Ubuntu 20.04
      Docker
      python3
      pandas

### Major steps
    1, Prepare for Docker images
    2, Compile Contracts 
    3, Launch Experiments
    4, Collect Results

### Experiment Preparation
Clone this repository:
```bash
git clone https://github.com/zqp542375/policySym_exp_scripts.git

```
Set up the project root directory to the **base_dir** parameter in your_project_root/scripts/**config_global.sh**.

Make sure the current directory is the project root directory.   


#### Step 1: Prepare for Docker images
```shell
./docker_image_preparation/prepare_for_docker_images.sh
```
#### Step 2: Compile Contracts 
Set the number of Docker containers to run simultaneously by setting the **batch_size** parameter in your_project_root/scripts/**config_global.sh**.

In our experiments, **batch_size** is set to 30 (each container has 4 cpus).

```shell
./scripts/compile_contracts.sh
```

#### Step 3: Launch Experiments for RQ3
Run the experiment scripts below and check results in the directory: your_project_root/results/
```shell
# run experiments for RQ3
./scripts/launch_24_exp_sGuard_rl.sh


```

#### Step 4: Collect Results
Set your project root directory to the **base_dir** parameter in your_project_root/result_collection/**config.py**.