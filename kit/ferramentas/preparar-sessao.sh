#!/usr/bin/env bash
# Prepara uma sessão nova do Claude Code na nuvem para usar o kit:
# Whisper (legendas), Hyperframes (vídeo) e Playwright (imagens PNG).
set -euo pipefail

TOOLS="${HOME}/tools"
VENV="${TOOLS}/venv"
mkdir -p "${TOOLS}"

# Whisper (whisper.cpp) para legendas automáticas
if ! command -v whisper-cli >/dev/null 2>&1; then
  if [ ! -d "${TOOLS}/whisper.cpp" ]; then
    git clone --depth 1 https://github.com/ggml-org/whisper.cpp "${TOOLS}/whisper.cpp"
  fi
  cmake -S "${TOOLS}/whisper.cpp" -B "${TOOLS}/whisper.cpp/build" -DCMAKE_BUILD_TYPE=Release -DWHISPER_BUILD_TESTS=OFF >/dev/null
  cmake --build "${TOOLS}/whisper.cpp/build" -j"$(nproc)" --config Release >/dev/null
  ln -sf "${TOOLS}/whisper.cpp/build/bin/whisper-cli" /usr/local/bin/whisper-cli
fi

# Playwright (Python) para gerar os PNG dos posts
if [ ! -x "${VENV}/bin/python" ]; then
  python3 -m venv "${VENV}"
  "${VENV}/bin/pip" install -q playwright
fi

# Hyperframes: o Node precisa usar o proxy da sessão para baixar o modelo do Whisper
export NODE_USE_ENV_PROXY=1
npx -y hyperframes doctor | grep -E "whisper|FFmpeg|Node"

echo "Pronto. Para gerar um post: ${VENV}/bin/python kit/ferramentas/render.py <arquivo.html> <saida.png> 1080 1350"
