#!/bin/bash

# the mount point is the base_dir

# Define a state variable

base_dir="path to project"
datasets_dir=${base_dir}+"datasets/"
results_dir=${base_dir}+"results/"
scripts_dir=${base_dir}+"scripts/"
export base_dir datasets_dir results_dir scripts_dir

batch_size=30
export batch_size




container_work_dir_mythril="/home/mythril/"
image_mythril=ad9a7d3e76b2
export container_work_dir_mythril image_mythril





container_work_dir_smartExecutor="/home/smartExecutor/"
image_smartExecutor_v3=86978a45f6f8 #v3.0

container_work_dir_policySym="/home/policySym/"
image_policySym=b57228540e04#v5.3

export container_work_dir_smartExecutor image_smartExecutor_v3 container_work_dir_policySym image_policySym
