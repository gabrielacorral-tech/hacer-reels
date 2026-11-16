---
name: reels-completo
description: Flujo completo para reels verticales (Instagram, TikTok, Shorts) desde una grabación cruda. Instala las herramientas, aprende el estilo de 3 videos de referencia y lo guarda en una hoja de marca, corta pausas y tomas repetidas, pone subtítulos, música, efectos y motion graphics, muestra un storyboard antes de renderizar, revisa cada corte y suma cada corrección como regla. Usar SIEMPRE que el usuario pase una grabación y pida editarla ("edita este reel", "corta las pausas", "pon subtítulos"), pase links de reels para copiar el estilo ("aprende este estilo", "haz mi hoja de marca"), diga "instala las herramientas de edición" o "configura mi skill". NO usar para escribir guiones.
---

# Reels completo

Este skill edita un reel vertical de punta a punta en cuatro etapas:

0. **Instalar** las herramientas (una sola vez).
1. **Aprender el estilo** de videos de referencia y guardarlo en `hoja-de-marca.md` (una sola vez por estilo).
2. **Editar** cada grabación con ese estilo, mostrando un storyboard antes de renderizar.
3. **Corregir y aprender**: cada corrección del usuario se vuelve una regla.

`scripts/`, `assets/`, `references/`, `estilo.json` y los `.md` están en la carpeta de este skill. Las carpetas de trabajo del usuario son:

- `grabaciones/` material crudo (nunca se modifica)
- `referencias/` videos de estilo y material permitido
- `exportes/` reels terminados
- `trabajo` es la carpeta de trabajo de cada reel: `edicion-<tema>`, al lado de la grabación.

## Etapa 0. Instalar (una sola vez)

1. Ejecuta `python3 scripts/revisar_entorno.py` y `bash scripts/revisar_herramientas.sh`.
2. Si falta algo, sigue `references/instalar.md`. Pide el OK del usuario antes de instalar cada programa.
3. Prueba cada herramienta con un comando mínimo y muéstrale al usuario una lista: instalada o falta.
4. No sigas hasta que ffmpeg, whisper.cpp y su modelo estén OK. Remotion, HyperFrames y yt-dlp se instalan cuando hacen falta.

## Etapa 1. Aprender el estilo

Ejecuta esta etapa cuando el usuario pase links de referencia, o cuando `hoja-de-marca.md` tenga `[COMPLETAR]`. Sigue `references/hoja-de-marca.md`.

Resumen:

1. Descarga cada video a `referencias/` con `yt-dlp`. El usuario responde por el permiso de uso.
2. Mide el estilo con `references/medir-referencia.md`: fuentes, colores, subtítulos, cortes por minuto, zooms, ritmo, motion graphics, música y sonido.
3. Escribe `hoja-de-marca.md`. Tiene que ser **propia, no una copia**: toma los patrones, no el contenido, la música ni las imágenes.
4. Muéstrale la hoja al usuario. **No edites hasta que la apruebe.** Una vez aprobada, se sigue siempre.

## Etapa 2. Editar

### 2.1 Antes de editar

1. Lee `hoja-de-marca.md`, `preferencias.md` y `correcciones.md`. No preguntes lo que ya responden. Si `hoja-de-marca.md` no está aprobada, vuelve a la Etapa 1.
2. Busca `[COMPLETAR]` en `preferencias.md`. Si aparece, sigue `references/configurar.md` antes de editar.
3. Ejecuta `python3 scripts/revisar_entorno.py`. Instala lo que falte, con el OK del usuario.
4. Crea `trabajo` al lado de la grabación, con el nombre `edicion-<tema>`. No la crees dentro del skill. Las correcciones necesitan sus archivos.

### 2.2 Material

- Pide la grabación y el guion, si existe.
- Pide imágenes, capturas y clips, si existen. Usa solo material con permiso.
- Sigue las reglas de autonomía de `preferencias.md`.
- Trabaja sobre una copia. Nunca modifiques la grabación original.

### 2.3 Cortar

```bash
python3 scripts/cortar_silencios.py grabacion.mp4 trabajo --min 0.25 --aire 0.10
```

- El script deja `editado.mp4`, `editado16k.wav` y `cortes.json`.
- Toma `--min` y `--aire` de `preferencias.md`.
- Si el tamaño es otro, pasa `--ancho`, `--alto` y `--fps`.
- Una grabación HDR de celular se pasa sola a SDR. El log lo avisa.

### 2.4 Transcribir y buscar tomas repetidas

```bash
python3 scripts/transcribir.py trabajo [--guion guion.txt]
```

- El script transcribe cada tramo por separado y deja `palabras.json`.
- Marca `REPITE`, `ARRANQUE`, `CORTA` y `FALTA`, y propone el rango por sacar.
- Corrige con `--quitar` en `cortar_silencios.py`. Conserva la última toma.
- Repite los pasos 3 y 4 hasta llegar a 0 alertas o justificar cada alerta.
- Compara cada frase con el guion. Whisper entiende mal nombres y marcas.

### 2.5 Planificar y storyboard

**Compuerta obligatoria:** antes de renderizar nada, muéstrale al usuario un storyboard y espera su OK. Salvo que haya pedido "hazlo completo" o lo diga `preferencias.md`.

El storyboard es una tabla con una fila por plano: tiempo, palabra donde arranca, qué se ve (cámara, captura, animación, imagen de `referencias/`), subtítulo, música y efecto de sonido. Si puedes, suma una hoja de cuadros de los planos clave.

1. Elige el formato en la tabla de `preferencias.md`.
2. Escribe una lista de planos con tiempos del video editado. Ancla cada plano a una palabra de `palabras.json`.
3. Muéstrale la lista al usuario si el formato es nuevo. Si pide "hazlo completo", sigue sin esperar.

Reglas por defecto. `preferencias.md` manda sobre estas reglas:

- La pantalla acompaña la voz. No repite lo que dice la voz.
- Cada plano llena la pantalla de borde a borde.
- Cada plano empieza en la primera sílaba de una palabra.
- Una imagen quieta lleva un zoom lento.
- El cierre va sin animaciones. El remate necesita la cara.

### 2.6 Animaciones y motion graphics

Empieza sin animaciones si el usuario recién arranca. Súmalas cuando los cortes y los subtítulos estén aprobados.

Usa motion graphics solo si la hoja de marca los incluye.

- Para una animación simple, usa `assets/animacion-ejemplo.html` con `render_html.mjs`.
- Para animaciones más ricas, usa HyperFrames o Remotion, ya instalados en la Etapa 0 (`references/instalar.md`). Renderiza a MP4 y súmalo como inserto en `plan.json`.

1. Copia `assets/animacion-ejemplo.html`.
2. Define `window.duracion` y `window.dibujar(t)`. Cada cuadro depende solo de `t`. Sin `setTimeout`, animaciones CSS ni azar sin semilla.
3. Saca fotos de la animación y corrige antes del render final.
4. La primera vez, instala Playwright: `cd scripts && npm install && npx playwright install chromium`.
5. Renderiza:

```bash
node scripts/render_html.mjs animacion.html trabajo/animacion.mp4 1080 1920
```

### 2.7 Subtítulos

```bash
python3 scripts/subtitulos.py trabajo estilo.json
```

- `estilo.json` guarda fuente, tamaño, color, posición y agrupado.
- El script lista cada subtítulo. Lee cada línea entera antes de armar.
- Corrige tildes, nombres y marcas con `correcciones` en `estilo.json`.
- Si el usuario pide copiar un estilo, sigue `references/medir-referencia.md`.

### 2.8 Armar

**Música y efectos:** si la hoja de marca los pide, usa solo audio con permiso o libre de derechos. Agrégalos en `plan.json` en la clave `musica` o como inserto de audio, y pide volumen bajo la voz (música cerca de −26 LUFS, voz −14). Anota el origen y la licencia en `trabajo/creditos.txt`.

Escribe `trabajo/plan.json`:

```json
{
  "base": "editado.mp4",
  "salida": "reel-v1.mp4",
  "insertos": [
    {"desde": 3.2, "hasta": 6.1, "archivo": "animacion.mp4"},
    {"desde": 7.0, "hasta": 8.5, "archivo": "clip.mp4", "t0": 12.0},
    {"desde": 9.0, "hasta": 12.0, "archivo": "captura.png", "zoom": 1.08, "foco": [0.5, 0.3]}
  ],
  "subtitulos": "subtitulos.ass",
  "lufs": -14
}
```

```bash
python3 scripts/armar.py trabajo/plan.json
```

- Las rutas de `plan.json` son relativas a `trabajo`.
- `t0` es el segundo del clip donde arranca el inserto. `foco` es el punto del zoom, de 0 a 1.
- Cambia `salida` en cada versión: `-v2`, `-v3`. El script no pisa una versión anterior.
- Cuando el usuario apruebe, ejecuta con `--final`. Comprime mejor.
- El script nivela el audio y verifica la cantidad de cuadros.

### 2.9 Revisar antes de mostrar

```bash
python3 scripts/hoja_cuadros.py trabajo/reel-v1.mp4 trabajo --plan trabajo/plan.json
```

Mira cada `hoja-NN.jpg` y `cola.jpg`. `hoja.txt` dice qué segundo muestra cada foto. Para sumar fotos en palabras clave, pasa `--tiempos 3.2,8.1`.

Responde cada pregunta:

- ¿Algún plano deja zonas vacías o negras?
- ¿Algún corte muestra un destello de otra toma?
- ¿El subtítulo tapa la cara o algo importante?
- ¿El subtítulo se lee sobre fondos claros?
- ¿Los últimos 15 cuadros muestran al usuario yendo a apagar la cámara?

Corrige lo que encuentres. Muestra el reel después de esta revisión.

### 2.10 Entregar

Exporta el reel final con `--final` y cópialo a `exportes/` con el nombre `<tema>-AAAA-MM-DD.mp4`. Sigue la sección "Entrega" de `preferencias.md`. Escribe un mensaje corto: qué cambió y qué hay que revisar. Deja el video al final del mensaje.

## Etapa 3. Corregir y aprender

Esta es la regla más importante del skill. Cada corrección del usuario se aplica dos veces:

1. Corrige el reel.
2. Escribe la regla en `correcciones.md`, con este formato:

```markdown
## AAAA-MM-DD · <reel>
- Dijo: "<la frase del usuario>"
- Por qué: <qué problema causaba>
- Regla: <qué hacer de ahora en más>
```

- Mueve a `preferencias.md` cada regla sobre gusto.
- Si un script puede chequear la regla, suma el chequeo al script.
- Antes de cerrar, dile al usuario qué regla sumaste. Usa una línea.

Mira `references/lecciones.md` cuando algo falle. Trae errores comunes de edición.
