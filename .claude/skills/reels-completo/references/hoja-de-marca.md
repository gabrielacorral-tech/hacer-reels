# Hoja de marca: aprender el estilo de 3 videos

Una hoja de marca es el estilo del usuario escrito en reglas medibles. Se hace una vez por estilo y se sigue siempre.

## Pasos

1. Pide 3 links o archivos de reels del estilo que el usuario quiere. Idealmente del mismo estilo.
2. Descárgalos a `referencias/` con `yt-dlp -o "referencias/ref-%(autonumber)s.%(ext)s" <link>`. Si el link es privado o falla, pide el archivo.
3. Mide cada video con `references/medir-referencia.md`, más esto:
   - **Cortes:** cantidad por minuto y duración media de plano.
   - **Zooms:** en qué momentos, cuánto, con qué ritmo.
   - **Subtítulos:** fuente, tamaño, color, borde, posición, palabras por subtítulo, palabra resaltada.
   - **Motion graphics:** qué aparece, cuándo, con qué animación y duración.
   - **Música y sonido:** volumen, género, efectos y en qué momentos suenan.
   - **Estructura:** gancho, desarrollo, cierre; segundos de cada parte.
4. Busca lo que **se repite en los tres**. Eso es el estilo. Lo que aparece en uno solo es del autor.
5. Escribe `hoja-de-marca.md` con la plantilla de abajo. Cada regla lleva un número o un ejemplo. Sin "dinámico" ni "moderno".
6. **Hazla propia:** cambia paleta, fuente y detalles para que el usuario no copie a nadie. Copia el método, no el contenido, la música ni las imágenes.
7. Muéstrasela al usuario, con 3 a 5 alternativas de subtítulo sobre cuadros difíciles. Espera la aprobación y márcala como `Estado: aprobada`.
8. Pasa lo medible a `estilo.json` y `preferencias.md`.

## Plantilla de `hoja-de-marca.md`

```markdown
# Hoja de marca
Estado: borrador | aprobada (AAAA-MM-DD)
Referencias: ref-1, ref-2, ref-3 (solo para estudio)

## Ritmo
- Cortes por minuto: …
- Duración de plano a cámara: …
- Pausas que se cortan: más largas que … s

## Subtítulos
- Fuente / tamaño / color / borde: …
- Palabras por subtítulo: … · Palabra resaltada: …

## Zooms y encuadre
- …

## Motion graphics
- Qué aparecen, colores, tipografías, duración: …

## Música y sonido
- Música: género, volumen (… dB bajo la voz)
- Efectos: cuáles y cuándo

## Estructura
- Gancho (… s) → desarrollo → cierre

## Nunca
- …
```
