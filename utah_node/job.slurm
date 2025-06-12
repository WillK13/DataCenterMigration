#!/bin/bash
#SBATCH --job-name=test_job
#SBATCH --output=job_output.txt
#SBATCH --ntasks=1
#SBATCH --time=00:05:00

echo "Running on $(hostname)"
sleep 300
