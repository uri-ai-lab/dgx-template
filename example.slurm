#!/bin/bash
#SBATCH -p dgx
#SBATCH --gres=gpu:volta:1

singularity exec --nv /home/shared/images/tensorflow-gpu-py3-plus.simg python "$@"
