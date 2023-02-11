#!/bin/bash
echo "Starting Run!"

# Reading arguments:
gpu_num=0
while getopts g: flag
do
    case "${flag}" in
        g) gpu_num=${OPTARG};;
    esac
done

# Setting GPU:
echo "Running on GPU: $gpu_num";
export CUDA_VISIBLE_DEVICES=$gpu_num

# Rendering function template:
train_and_render() {
	# Train:
	echo "Starting Training..."
	python run_sds_on_high_res_model.py \
	-d ./data/${1}/ \
	-o ./logs/rf/${1}_sds_dir_${3}_dcl_${5}_${4}/ \
	-i ./logs/rf/high_res_${1}_diffuse/saved_models/model_final.pth \
	-p "$2" \
	--directional_dataset=${3} \
	--density_correlation_weight=${5} \
	--sh_degree=0 # we currently only support diffuse

	# Rendering Output Video:
	echo "Starting Rendering..."
	python render_sh_based_voxel_grid.py \
	-i ./logs/rf/${1}_sds_dir_${3}_dcl_${5}_${4}/saved_models/model_final.pth \
	-o ./output_renders/${1}_sds_dir_${3}_dcl_${5}_${4}
}

# STARTING RUN:

scene=dog2
prompt="a render of a cute light gray dog wearing sunglasses"
directional=True
log_name="sunglasses" # 1-word description of the prompt for saving
dcl_weight=0.1

train_and_render $scene "$prompt" $directional $log_name $dcl_weight

scene=dog2
prompt="a render of a cute light gray dog wearing sunglasses"
directional=True
log_name="sunglasses" # 1-word description of the prompt for saving
dcl_weight=0.5

train_and_render $scene "$prompt" $directional $log_name $dcl_weight

scene=dog2
prompt="a render of a cute light gray dog wearing sunglasses"
directional=True
log_name="sunglasses" # 1-word description of the prompt for saving
dcl_weight=1

train_and_render $scene "$prompt" $directional $log_name $dcl_weight

scene=dog2
prompt="a render of a cute light gray dog wearing sunglasses"
directional=True
log_name="sunglasses" # 1-word description of the prompt for saving
dcl_weight=5

train_and_render $scene "$prompt" $directional $log_name $dcl_weight

scene=dog2
prompt="a render of a cute light gray dog wearing sunglasses"
directional=True
log_name="sunglasses" # 1-word description of the prompt for saving
dcl_weight=10

train_and_render $scene "$prompt" $directional $log_name $dcl_weight

scene=dog2
prompt="a render of a cute light gray dog wearing sunglasses"
directional=True
log_name="sunglasses" # 1-word description of the prompt for saving
dcl_weight=50

train_and_render $scene "$prompt" $directional $log_name $dcl_weight

scene=dog2
prompt="a render of a cute light gray dog wearing sunglasses"
directional=True
log_name="sunglasses" # 1-word description of the prompt for saving
dcl_weight=100

train_and_render $scene "$prompt" $directional $log_name $dcl_weight

scene=dog2
prompt="a render of a cute light gray dog wearing sunglasses"
directional=True
log_name="sunglasses" # 1-word description of the prompt for saving
dcl_weight=500

train_and_render $scene "$prompt" $directional $log_name $dcl_weight

scene=dog2
prompt="a render of a cute light gray dog wearing sunglasses"
directional=True
log_name="sunglasses" # 1-word description of the prompt for saving
dcl_weight=1000

train_and_render $scene "$prompt" $directional $log_name $dcl_weight

scene=dog2
prompt="a render of a cute light gray dog wearing sunglasses"
directional=True
log_name="sunglasses" # 1-word description of the prompt for saving
dcl_weight=5000

train_and_render $scene "$prompt" $directional $log_name $dcl_weight

scene=dog2
prompt="a render of a cute light gray dog wearing sunglasses"
directional=True
log_name="sunglasses" # 1-word description of the prompt for saving
dcl_weight=10000

train_and_render $scene "$prompt" $directional $log_name $dcl_weight