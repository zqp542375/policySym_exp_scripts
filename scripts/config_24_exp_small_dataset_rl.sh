#!/bin/bash

# experiment:24_exp_small_dataset_rl

dataset_name_exp_small_dataset="small_dataset"
contract_info_csv_name="small_dataset_test_contracts"

export dataset_name_exp_small_dataset contract_info_csv_name



cli_timeout=900
tool_timeout=800
solver_timeout=10000
execution_times=3
export cli_timeout tool_timeout solver_timeout execution_times


container_run_script_mythril="run_mythril_v0.23.22.sh"
container_run_script_smartExecutor="run_smartExecutor_v3.0.sh"
container_run_script_spolicySym="run_policySym.sh"
 
export container_run_script_mythril container_run_script_smartExecutor container_run_script_policySym

