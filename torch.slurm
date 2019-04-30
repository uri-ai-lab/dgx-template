#!/bin/bash
#SBATCH -p dgx
#SBATCH --gres=gpu:volta:1

singularity exec --nv  /home/shared/images/torch-gpu-py3.simg python "$@"
