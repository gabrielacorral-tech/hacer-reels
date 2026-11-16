# Instalar las herramientas

Pide el OK del usuario antes de instalar cada una. Prueba cada una al terminar. Después de instalar, ejecuta `bash scripts/revisar_herramientas.sh`.

| Herramienta | Para qué | Obligatoria |
|---|---|---|
| FFmpeg | cortar, unir, mezclar audio | sí |
| whisper.cpp + modelo | transcribir | sí |
| yt-dlp | descargar videos de referencia | para la Etapa 1 |
| Node | animaciones y Playwright | solo animaciones |
| Remotion | motion graphics con React | opcional |
| HyperFrames | motion graphics con HTML | opcional |

Repositorios: `github.com/FFmpeg/FFmpeg`, `github.com/ggml-org/whisper.cpp`, `github.com/yt-dlp/yt-dlp`, `github.com/remotion-dev/remotion`, `github.com/heygen-com/hyperframes`. Verifica en cada README la instalación vigente; los comandos cambian.

## Mac (Homebrew)

```bash
brew install ffmpeg whisper-cpp yt-dlp node
```

## Windows

Usa `winget install Gyan.FFmpeg`, `winget install yt-dlp.yt-dlp`, `winget install OpenJS.NodeJS`. Para whisper.cpp, baja el binario de la sección Releases del repositorio.

## Linux

```bash
sudo apt install ffmpeg nodejs npm
pipx install yt-dlp
```

Compila whisper.cpp desde su repositorio.

## Modelo de whisper

Pesa unos 1,6 GB (modelo grande). `scripts/comun.py` busca la ruta en la función `modelo`; mira `scripts/revisar_entorno.py` para ver dónde lo espera. Descárgalo con el script `download-ggml-model.sh` de whisper.cpp.

## Animaciones

```bash
cd scripts && npm install && npx playwright install chromium
```

Remotion y HyperFrames se instalan dentro de una carpeta de proyecto, no globalmente. Sigue el README de cada uno y guarda el proyecto en `trabajo/`.

## Prueba mínima de cada una

```bash
ffmpeg -version | head -1
yt-dlp --version
node --version
```

Para whisper.cpp, transcribe 5 segundos de cualquier audio. Si algo falla, copia el error al usuario y propón el arreglo. No uses `sudo` sin avisar.
