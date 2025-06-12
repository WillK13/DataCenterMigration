#!/bin/bash

# CloudLab Restore Script
# Copies SLURM configs and ML job files to each node

# Configuration
KEY=~/.ssh/cloudlab_rsa

# Node IPs
CONTROLLER_IP=130.127.133.200
UTAH_IP=128.110.216.235
WISC_IP=128.105.145.50

# Copy files to controller node (node-5)
echo "[*] Syncing controller files..."
scp -i $KEY -r ./controller/* wkamin01@$CONTROLLER_IP:~

# Copy SLURM configs and job files to Utah node (node-3)
echo "[*] Syncing Utah node files..."
scp -i $KEY -r ./utah_node/slurm.conf wkamin01@$UTAH_IP:~
scp -i $KEY -r ./utah_node/ml_job.slurm ./utah_node/ml_task.py wkamin01@$UTAH_IP:~

# Copy SLURM configs and job files to Wisconsin node (node-2)
echo "[*] Syncing Wisconsin node files..."
scp -i $KEY -r ./wisconsin_node/slurm.conf wkamin01@$WISC_IP:~
scp -i $KEY -r ./wisconsin_node/ml_job.slurm ./wisconsin_node/ml_task.py wkamin01@$WISC_IP:~

echo "SSH into each node to restart SLURM and run jobs if needed."

