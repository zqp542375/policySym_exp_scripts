#!/bin/bash
# experiment:24_exp_sGuard
exp_name="24_exp_small_dataset_rl"

source ./scripts/config_global.sh
source ./scripts/config_24_exp_small_dataset_rl.sh


dataset_name=${dataset_name_exp_small_dataset}
root_dir=${base_dir}
container_work_dir=${container_work_dir_mythril}    
run_script=${container_work_dir}scripts/mythril/${container_run_script_mythril}

contract_info_csv_name_prefix=${contract_info_csv_name}


cli_timeout=${cli_timeout}
tool_timeout=${tool_timeout}
solver_timeout=${solver_timeout} # default timeout for this version of SmartExecutor

execution_times=${execution_times}

image_id=${image_mythril}

echo ""
echo ==============================================================
echo experiment:${exp_name}
echo "      the dataset to be evaluated:" $dataset_name
echo "  the root folder of this project:" $root_dir
echo "the work directory in a container:" $container_work_dir
echo "the script running in a container:" $run_script
echo "          file with contract info:" $contract_info_csv_name

echo "  the timeout set to command line:" ${tool_timeout}s
echo " the timeout the tool can execute:" ${execution_times}
echo "     the Docker image of the tool:" $image_id
echo ---------------------------------------------------------------


# iterate three times
for ((run_idx = 1; run_idx <=execution_times; run_idx ++));
do


	#======= mythril ==============

	# arguments:work dir, dataset name, group index, prefix of the csv file, prefix of the contract group folder
	# command line timeout, tool timeout, run index (iteration index)
	echo ""
	echo "start Docker container mythril_${run_idx}" 
	
	
	docker run --rm --cpus 4 -v ${root_dir}:${container_work_dir} --name mythril_${run_idx}  --entrypoint ${run_script} ${image_id} ${container_work_dir} ${dataset_name}  ${contract_info_csv_name} ${cli_timeout} ${tool_timeout} ${run_idx} &


done # end of iterations

exit








