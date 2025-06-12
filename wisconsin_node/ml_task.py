# ml_task.py
import torch
import time
import os

# Simulate a model and optimizer
model = torch.nn.Linear(10, 1)
optimizer = torch.optim.SGD(model.parameters(), lr=0.01)

# Resume if checkpoint exists
start_epoch = 0
if os.path.exists("checkpoint.pt"):
    checkpoint = torch.load("checkpoint.pt")
    model.load_state_dict(checkpoint["model_state_dict"])
    optimizer.load_state_dict(checkpoint["optimizer_state_dict"])
    start_epoch = checkpoint["epoch"] + 1
    print(f"Resumed from epoch {start_epoch}")

# Train loop (simulated)
for epoch in range(start_epoch, 10):
    time.sleep(20)  # simulate training time
    print(f"Epoch {epoch}")
    torch.save({
        "epoch": epoch,
        "model_state_dict": model.state_dict(),
        "optimizer_state_dict": optimizer.state_dict(),
    }, "checkpoint.pt")
