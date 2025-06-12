#!/bin/bash
#SBATCH --job-name=ml_task
#SBATCH --output=ml_out.txt
#SBATCH --ntasks=1
#SBATCH --time=00:20:00

python3 ~/ml_task.py
