#!/bin/bash

# parefor Docker iamges for:
# Manticore
# Mythril
# SmartExecutor
# Smartian

echo current path:
pwd

echo prepare Docker image for Mythril
#./docker_image_preparation/mythril/create_mythril_docker_image.sh



echo prepare Docker image for SmartExecutor
#./docker_image_preparation/smartExecutor/create_smartExecutor_docker_image.sh


echo prepare Docker image for PolicySym
#./docker_image_preparation/policySym/create_policySym_docker_image.sh






