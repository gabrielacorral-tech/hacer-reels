#!/usr/bin/env bash
# Revisa las 5 herramientas del flujo y dice cuáles faltan.
# Uso: bash revisar_herramientas.sh
falta=0
chk() { # nombre, comando de prueba, ayuda
  if eval "$2" >/dev/null 2>&1; then echo "OK    $1"; else echo "FALTA $1  -> $3"; falta=$((falta+1)); fi
}
chk "ffmpeg"      "ffmpeg -version"                       "references/instalar.md (ffmpeg)"
chk "whisper.cpp" "command -v whisper-cli || command -v whisper-cpp || command -v main" "references/instalar.md (whisper.cpp)"
chk "yt-dlp"      "yt-dlp --version"                      "references/instalar.md (yt-dlp)"
chk "node"        "node --version"                        "references/instalar.md (Node)"
chk "remotion"    "npx --no-install remotion --version"   "references/instalar.md (Remotion, solo si hacés animaciones)"
chk "hyperframes" "npx --no-install hyperframes --help"   "references/instalar.md (HyperFrames, solo si hacés animaciones)"
echo; [ $falta -eq 0 ] && echo "Todo listo." || echo "Faltan $falta. Remotion y HyperFrames son opcionales."
