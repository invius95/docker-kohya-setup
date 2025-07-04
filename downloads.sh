#!/bin/bash
set -e

echo "===== Starte Setup ====="

# Speicherpfade vorbereiten
mkdir -p /workspace/storage/{clip,unet,vae}

# === Huggingface Downloads ===
if [[ -z "$HF_TOKEN" ]]; then
  echo "❌ HF_TOKEN ist nicht gesetzt!"
  exit 1
fi

curl -L -H "Authorization: Bearer $HF_TOKEN" \
  "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/text_encoder/model.safetensors" \
  -o /workspace/storage/clip/clip_l.safetensors

curl -L -H "Authorization: Bearer $HF_TOKEN" \
  "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/text_encoder_2/model-00001-of-00002.safetensors" \
  -o /workspace/storage/clip/t5xxl_fp16_1_of_2.safetensors

  curl -L -H "Authorization: Bearer $HF_TOKEN" \
  "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/text_encoder_2/model-00002-of-00002.safetensors" \
  -o /workspace/storage/clip/t5xxl_fp16_2_of_2.safetensors

curl -L -H "Authorization: Bearer $HF_TOKEN" \
  "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/vae/diffusion_pytorch_model.safetensors" \
  -o /workspace/storage/vae/flux_dev_vae.safetensors

# === Civitai Downloads ===
if [[ -z "$CIVITAI_TOKEN" ]]; then
  echo "❌ CIVITAI_TOKEN ist nicht gesetzt!"
  exit 1
fi

curl -L -H "Authorization: Bearer $CIVITAI_TOKEN" \
  "https://civitai.com/api/download/models/1823302?type=Model&format=SafeTensor&size=pruned&fp=fp8" \
  -o /workspace/storage/unet/fluxedUpFluxNSFW_41DevFp8.safetensors

curl -L -H "Authorization: Bearer $CIVITAI_TOKEN" \
  "https://civitai.com/api/download/models/1739874?type=Model&format=SafeTensor&size=pruned&fp=fp8" \
  -o /workspace/storage/unet/fuxCapacityNSFWPornFlux_21.safetensors

curl -L -H "Authorization: Bearer $CIVITAI_TOKEN" \
  "https://civitai.com/api/download/models/1905927?type=Model&format=SafeTensor&size=full&fp=fp16" \
  -o /workspace/storage/unet/getphatFLUXReality_v8.safetensors

curl -L -H "Authorization: Bearer $CIVITAI_TOKEN" \
  "https://civitai.com/api/download/models/1703341?type=Model&format=SafeTensor&size=full&fp=fp8" \
  -o /workspace/storage/unet/realDream_flux1V1.safetensors

echo "===== Setup abgeschlossen ====="
