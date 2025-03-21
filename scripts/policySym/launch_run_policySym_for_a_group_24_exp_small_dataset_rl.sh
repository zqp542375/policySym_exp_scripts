#!/bin/bash

# experiment:24_exp_sGuard
exp_name="24_exp_sGuardz_rl"

source ./scripts/config_global.sh
source ./scripts/config_24_exp_small_dataset_rl.sh

dataset_name=${dataset_name_exp_small_dataset}
root_dir=${base_dir}
container_work_dir=${container_work_dir_smartExecutor}    
run_script=${container_work_dir}scripts/smartExecutor_rl/${container_run_script_smartExecutor_rl}

contract_info_csv_name=${contract_info_csv_name}




cli_timeout=${cli_timeout}
tool_timeout=${tool_timeout}
solver_timeout=${solver_timeout} # default timeout for this version of SmartExecutor

execution_times=${execution_times}

image_id=${image_smartExecutor_rl}

echo ""
echo ==============================================================
echo experiment:${exp_name}

echo "      the dataset to be evaluated:" $dataset_name
echo "  the root folder of this project:" $root_dir
echo "the work directory in a container:" $container_work_dir
echo "the script running in a container:" $run_script
echo "prefix of file with contract info:" $contract_info_csv_name_prefix
echo "contract group folder name prefix:" $contract_group_name_prefix
echo "   start index of contract groups:" $group_start_idx
echo "     end index of contract groups:" $group_end_idx
echo "    # of containers to be started:" $batch_size
echo "  the timeout set to command line:" ${tool_timeout}s
echo " the timeout the tool can execute:" ${execution_times}
echo "     the Docker image of the tool:" $image_id
echo ---------------------------------------------------------------


# iterate three times
for ((run_idx = 1; run_idx <=execution_times; run_idx ++));
do

	#======= smartExecutor v5.3 ==============

	# arguments:work dir, dataset name, group index, prefix of the csv file, prefix of the contract group folder
	# command line timeout, tool timeout, depth limit of Phase 1, run index (iteration index)
	echo ""
	echo "start Docker container smartExecutor_v5.3_${run_idx} " 
	
	
	docker run --rm --cpus 4 -v ${root_dir}:${container_work_dir} --name smartexecutor_v5.3_${run_idx}  --entrypoint ${run_script} ${image_id} ${container_work_dir} ${dataset_name} ${contract_info_csv_name} ${cli_timeout} ${tool_timeout} ${run_idx} &

	

done # end of iterations

exit


con_work_dir=${1}
dataset_name=${2} 
csv_data_file=${3}
cli_timeout=${4}
tool_timeout=${5}
run_idx=${6}





