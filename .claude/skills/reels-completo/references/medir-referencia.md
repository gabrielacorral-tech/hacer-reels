# Medir un video de referencia

Convierte un gusto en números. Mide el estilo. No copies el contenido.

Pídele al usuario el archivo o un link. El usuario responde por el permiso de uso.

## Subtítulos

1. Saca cuadros donde se vea un subtítulo, con un ancho real de 1080 px si puedes.
2. Prueba varias fuentes del sistema con el mismo texto. Superpone cada prueba con el cuadro y compara la coincidencia, palabra por palabra.
3. Mide el tamaño con el ancho de la tinta en tres textos distintos.
4. Mide la altura de la línea de base.
5. Mide el color con el promedio de los píxeles del texto.
6. Mide la sombra y el borde. Resta un cuadro vacío de un cuadro con texto.
7. Mide cuándo entra y sale cada subtítulo, en cuadros, contra la voz.
8. Cuenta las palabras por subtítulo. Anota mayúsculas, puntuación y palabras marcadas.

Guarda los resultados en `estilo.json`.

Antes de armar un reel, muestra 3 a 5 alternativas sobre cuadros difíciles: fondo claro, fondo oscuro y ropa con rayas. Así el usuario elige sin esperar un render completo.

## Ritmo

```bash
ffmpeg -i referencia.mp4 -vf "select='gt(scene,0.3)',showinfo" -f null - 2>&1 | grep -c pts_time
```

- Ese número es la cantidad de cortes de plano. Divídelo por los minutos del video.
- Mide cuánto dura cada plano a cámara.
- Calcula qué parte del video muestra la cara.

## Audio

```bash
ffmpeg -i referencia.mp4 -af loudnorm=print_format=json -f null - 2>&1 | tail -12
```

`input_i` es el volumen en LUFS.

## Estructura

1. Transcribe el video con whisper.
2. Marca el gancho, los pasos o partes, los cortes a cámara y el cierre, con segundos.
3. Guarda esa estructura como un formato en `preferencias.md`.

Muéstrale al usuario una tabla con lo medido. Pregunta qué quiere copiar. El usuario decide.
