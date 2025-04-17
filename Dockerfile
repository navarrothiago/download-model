FROM registry.access.redhat.com/ubi9/python-311:latest AS builder

USER root

# Install dependencies
RUN pip install huggingface-hub

# Copy download script
COPY download_model.py .

# Use BuildKit secret mount for the token
# The token will not be stored in the image layers
RUN --mount=type=secret,id=hf_token \
    HUGGING_FACE_HUB_TOKEN=$(cat /run/secrets/hf_token) \
    python download_model.py

# Final image containing only the essential model files
FROM quay.io/modh/vllm@sha256:4f1f6b5738b311332b2bc786ea71259872e570081807592d97b4bd4cb65c4be1

# Copy the model files from the base container
COPY --from=builder /models /models

USER 1001
