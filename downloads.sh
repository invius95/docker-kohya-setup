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
  "https://huggingface.co/USER/MODEL1/resolve/main/clip_l.safetensors" \
  -o /workspace/storage/clip/clip_l.safetensors

curl -L -H "Authorization: Bearer $HF_TOKEN" \
  "https://huggingface.co/USER/MODEL2/resolve/main/t5xxl_fp16_merged.safetensors" \
  -o /workspace/storage/clip/t5xxl_fp16_merged.safetensors

curl -L -H "Authorization: Bearer $HF_TOKEN" \
  "https://huggingface.co/USER/MODEL3/resolve/main/flux_dev_vae.safetensors" \
  -o /workspace/storage/vae/flux_dev_vae.safetensors

# === Civitai Downloads ===
if [[ -z "$CIVITAI_TOKEN" ]]; then
  echo "❌ CIVITAI_TOKEN ist nicht gesetzt!"
  exit 1
fi

curl -L -H "Authorization: Bearer $CIVITAI_TOKEN" \
  "https://civitai.com/api/download/models/XXX" \
  -o /workspace/storage/unet/fluxedUpFluxNSFW_41DevFp8.safetensors

curl -L -H "Authorization: Bearer $CIVITAI_TOKEN" \
  "https://civitai.com/api/download/models/YYY" \
  -o /workspace/storage/unet/fuxCapacityNSFWPornFlux_21.safetensors

curl -L -H "Authorization: Bearer $CIVITAI_TOKEN" \
  "https://civitai.com/api/download/models/ZZZ" \
  -o /workspace/storage/unet/getphatFLUXReality_v8.safetensors

curl -L -H "Authorization: Bearer $CIVITAI_TOKEN" \
  "https://civitai.com/api/download/models/AAA" \
  -o /workspace/storage/unet/realDream_flux1V1.safetensors

echo "===== Setup abgeschlossen ====="
