#!/bin/bash
set -e

echo "===== Starte Setup ====="

# Speicherpfade vorbereiten
mkdir -p /workspace/storage/{clip,unet,vae}

# === Huggingface Downloads ===
export HF_TOKEN="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"

# Beispiel Huggingface Download
curl -L -H "Authorization: Bearer $HF_TOKEN" \
  "https://huggingface.co/USER/MODEL1/resolve/main/clip_l.safetensors" \
  -o /workspace/storage/clip/clip_l.safetensors

curl -L -H "Authorization: Bearer $HF_TOKEN" \
  "https://huggingface.co/USER/MODEL2/resolve/main/t5xxl_fp16_merged.safetensors" \
  -o /workspace/storage/clip/t5xxl_fp16_merged.safetensors

# === Civitai Downloads ===
export CIVIT_TOKEN="c79f563e9a8c706206c7b04edd937532"

# Beispiel Civitai Download
curl -L -H "Authorization: Bearer $CIVIT_TOKEN" \
  "https://civitai.com/api/download/models/XXX" \
  -o /workspace/storage/unet/fluxedUpFluxNSFW_41DevFp8.safetensors

curl -L -H "Authorization: Bearer $CIVIT_TOKEN" \
  "https://civitai.com/api/download/models/YYY" \
  -o /workspace/storage/unet/fuxCapacityNSFWPornFlux_21.safetensors

curl -L -H "Authorization: Bearer $CIVIT_TOKEN" \
  "https://civitai.com/api/download/models/ZZZ" \
  -o /workspace/storage/unet/getphatFLUXReality_v8.safetensors

curl -L -H "Authorization: Bearer $CIVIT_TOKEN" \
  "https://civitai.com/api/download/models/AAA" \
  -o /workspace/storage/unet/realDream_flux1V1.safetensors

# VAE
curl -L -H "Authorization: Bearer $HF_TOKEN" \
  "https://huggingface.co/USER/MODEL3/resolve/main/flux_dev_vae.safetensors" \
  -o /workspace/storage/vae/flux_dev_vae.safetensors

echo "===== Setup abgeschlossen ====="
