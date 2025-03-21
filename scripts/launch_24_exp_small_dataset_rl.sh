#!/bin/bash

# run Mythril
./scripts/mythril/launch_run_mythril_v0.23.22_for_24_exp_small_dataset_rl.sh

# run SmartExecutor
./scripts/smartExecutor/launch_run_smartExecutor_v3.0_for_groups_24_exp_small_dataset_rl.sh  

# run SmartExecutor_rl (no grouping)
./scripts/policySym/launch_run_policySym_for_a_group_24_exp_small_dataset_rl.sh

