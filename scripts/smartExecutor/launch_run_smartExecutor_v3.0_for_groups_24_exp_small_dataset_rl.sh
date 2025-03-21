#!/bin/bash

# experiment:24_exp_small_dataset_rl
exp_name="24_exp_small_dataset_rl"

source ./scripts/config_global.sh
source ./scripts/config_24_exp_small_dataset_rl.sh


dataset_name=${dataset_name_exp_sGuard}
root_dir=${base_dir}
container_work_dir=${container_work_dir_smartExecutor}    
run_script=${container_work_dir}scripts/smartExecutor/${container_run_script_smartExecutor}

contract_info_csv_name=${contract_info_csv_name}



cli_timeout=${cli_timeout}
tool_timeout=${tool_timeout}
solver_timeout=${solver_timeout} # default timeout for this version of SmartExecutor

execution_times=${execution_times}

image_id=${image_smartExecutor_v3}

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

	#======= smartExecutor v3.0 ==============

	# arguments:work dir, dataset name, the csv file,
	# command line timeout, tool timeout, run index (iteration index)
	echo ""
	echo "start Docker container smartExecutor_v3.0_${run_idx}" 
	
	
	docker run --rm --cpus 4 -v ${root_dir}:${container_work_dir} --name smartexecutor_v3.0_${run_idx}  --entrypoint ${run_script} ${image_id} ${container_work_dir} ${dataset_name} ${contract_info_csv_name} ${cli_timeout} ${tool_timeout} ${run_idx} &

done # end of iterations

exit










