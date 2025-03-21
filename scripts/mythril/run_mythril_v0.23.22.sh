#!/bin/bash

# =========================
# run within a container
#=========================

echo ""
echo ==== inside the container =====

con_work_dir=${1}
dataset_name=${2} # the folder name under the folder "contracts"
csv_data_file=${3}


cli_timeout=${4}
tool_timeout=${5}
run_idx=${6}
solver_timeout=10000 # default timeout for this version of SmartExecutor

echo received the parameters and their values
echo con_work_dir=$con_work_dir
echo dataset_name=$dataset_name # the folder name under the folder "contracts"


echo csv_data_file=$csv_data_file


echo cli_timeout=$cli_timeout
echo tool_timeout=$tool_timeout
echo solver_timeout=10000 # default timeout for this version of mythril_v0.23.22
echo run_idx=$run_idx




tool_name=mythril_v0.23.22
solidity_folder="solidity_files"


# prepare for the folder to save results
result_folder=${tool_name}_results_${tool_timeout}s_${run_idx}
result_dir=${con_work_dir}results/

cd ${result_dir}

if [ ! -d ${dataset_name} ]; then
  mkdir ${dataset_name}
fi

cd ${dataset_name}

if [ -d ${result_folder} ]; then
	rm -rf ${result_folder} 
fi
mkdir ${result_folder}

# update result_dir where the result data will be held
result_dir=${con_work_dir}results/${dataset_name}/${result_folder}/


echo "save results in ${result_folder}"

# the path where solidity files, binary files, and abi files are held
contract_dir=${con_work_dir}datasets/${dataset_name}/${contract_folder_prefix}_${group_index}/

exec < ${contract_dir}${csv_data_file}.csv || exit 1
#read header # read (and ignore) the first line
while IFS="," read solidity_name solc_version contract_name 
  do
 echo "++++ ${solidity_name}  :  ${solc_version}  :  ${contract_name} ++++"  | tee -a ${result_dir}${solidity_name}__${contract_name}_${tool_name}_${tool_timeout}_${run_idx}.txt
	
	 	
	start=$(date +%s.%N)
	timeout ${cli_timeout} myth analyze ${contract_dir}${solidity_folder}/${solidity_name}:${contract_name} --create-timeout 60 --execution-timeout ${tool_timeout} --solver-timeout ${solver_timeout} --pruning-factor 1.0 | tee -a ${result_dir}${solidity_name}__${contract_name}_${tool_name}_${tool_timeout}_${run_idx}.txt
	
	end=$(date +%s.%N) 
	runtime1=$(python -c "print(${end} - ${start})")
	
        echo "time_used: "${runtime1}" seconds"  | tee -a ${result_dir}${solidity_name}__${contract_name}_${tool_name}_${tool_timeout}_${run_idx}.txt


	echo "#@contract_info_time" | tee -a ${result_dir}${solidity_name}__${contract_name}_${tool_name}_${tool_timeout}_${run_idx}.txt
 
	echo ${solidity_name}:${solc_version}:${contract_name}:${runtime1} | tee -a ${result_dir}${solidity_name}__${contract_name}_${tool_name}_${tool_timeout}_${run_idx}.txt


  done

