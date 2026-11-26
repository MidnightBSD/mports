import torch
from torch import nn


torch.manual_seed(42)

model = nn.Linear(2, 1)
features = torch.tensor([[1.0, 2.0], [2.0, 1.0]])
targets = torch.tensor([[1.0], [0.0]])

# Run a small SGD step using autograd without importing optional compiler deps.
model.train()
prediction = model(features)
loss = nn.functional.mse_loss(prediction, targets)
loss.backward()
assert model.weight.grad is not None

with torch.no_grad():
    model.weight -= 0.01 * model.weight.grad
    model.bias -= 0.01 * model.bias.grad

model.eval()
with torch.no_grad():
    prediction = model(features)

assert prediction.shape == (2, 1)
assert torch.isfinite(prediction).all()
print("PyTorch training and inference smoke check passed")
