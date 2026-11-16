# Instalar las herramientas

Pedí el OK del usuario antes de instalar cada una. Probá cada una al terminar. Después de instalar, corré `bash scripts/revisar_herramientas.sh`.

| Herramienta | Para qué | Obligatoria |
|---|---|---|
| FFmpeg | cortar, unir, mezclar audio | sí |
| whisper.cpp + modelo | transcribir | sí |
| yt-dlp | descargar videos de referencia | para la Etapa 1 |
| Node | animaciones y Playwright | solo animaciones |
| Remotion | motion graphics con React | opcional |
| HyperFrames | motion graphics con HTML | opcional |

Repositorios: `github.com/FFmpeg/FFmpeg`, `github.com/ggml-org/whisper.cpp`, `github.com/yt-dlp/yt-dlp`, `github.com/remotion-dev/remotion`, `github.com/heygen-com/hyperframes`. Verificá en cada README la instalación vigente; los comandos cambian.

## Mac (Homebrew)

```bash
brew install ffmpeg whisper-cpp yt-dlp node
```

## Windows

Usá `winget install Gyan.FFmpeg`, `winget install yt-dlp.yt-dlp`, `winget install OpenJS.NodeJS`. Para whisper.cpp, bajá el binario de la sección Releases del repositorio.

## Linux

```bash
sudo apt install ffmpeg nodejs npm
pipx install yt-dlp
```

Compilá whisper.cpp desde su repositorio.

## Modelo de whisper

Pesa unos 1,6 GB (modelo grande). `scripts/comun.py` busca la ruta en la función `modelo`; mirá `scripts/revisar_entorno.py` para ver dónde lo espera. Descargalo con el script `download-ggml-model.sh` de whisper.cpp.

## Animaciones

```bash
cd scripts && npm install && npx playwright install chromium
```

Remotion y HyperFrames se instalan dentro de una carpeta de proyecto, no globalmente. Seguí el README de cada uno y guardá el proyecto en `trabajo/`.

## Prueba mínima de cada una

```bash
ffmpeg -version | head -1
yt-dlp --version
node --version
```

Para whisper.cpp, transcribí 5 segundos de cualquier audio. Si algo falla, copiá el error al usuario y proponé el arreglo. No uses `sudo` sin avisar.
