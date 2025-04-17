from huggingface_hub import snapshot_download
import os

# Get the Hugging Face token from environment variable
hf_token = os.environ.get("HUGGING_FACE_HUB_TOKEN")
if not hf_token:
    raise ValueError("HUGGING_FACE_HUB_TOKEN environment variable is not set")

os.makedirs("/models", exist_ok=True)

# Specify the Hugging Face repository containing the model
model_repo = "meta-llama/Llama-3.3-70B-Instruct"
snapshot_download(
    repo_id=model_repo,
    local_dir="/models",
    allow_patterns=["*.safetensors", "*.json", "*.txt"],
    token=hf_token,
)
