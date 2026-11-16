# Configurar el skill

Entrevista al usuario. Completa `preferencias.md` y `estilo.json` con sus respuestas.

## Reglas de la entrevista

- Haz un bloque por mensaje, con 3 preguntas como máximo.
- Ofrece opciones concretas y un valor sugerido.
- Acepta "no sé" o "elige tú". Usa el valor sugerido y márcalo "(sugerido)".
- Guarda cada bloque al terminarlo. Así la entrevista se puede cortar y retomar.
- Copia la frase del usuario cuando exprese un gusto fuerte.
- Reemplaza cada `[COMPLETAR]`. No dejes campos sin responder.
- Si el usuario pide "hazlo igual", usa los valores sugeridos y pasa a la prueba.

## Bloques

### 1. Contenido

- ¿De qué hablan tus reels, y en qué idioma?
- ¿Cómo grabas: celular, cámara, teleprompter o improvisado?

### 2. Referencia

Este bloque responde muchos de los siguientes.

- Pide hasta 3 videos que el usuario quiera igualar.
- Mídelos con `references/medir-referencia.md`.
- Muéstrale lo que encontraste. Pregunta qué quiere copiar y qué no.

### 3. Formatos

- ¿Qué tipos de reel haces? Ejemplos: tutorial, noticia, opinión, reseña.
- Por cada tipo, ¿cómo es el gancho, el cuerpo y el cierre?

Guarda de 1 a 4 formatos. Si el usuario no sabe, empieza con uno solo.

### 4. Cortes

Ofrece tres ritmos:

| Ritmo | `--min` | `--aire` |
|---|---|---|
| Tranquilo | 0,60 | 0,20 |
| Medio | 0,35 | 0,15 |
| Picado | 0,25 | 0,10 |

- ¿Qué muletillas se sacan?
- ¿Qué pausas o muletillas son parte de tu estilo y quedan?

### 5. Subtítulos

- ¿Llevan subtítulos?
- ¿Qué fuente, tamaño, color y altura? Si hay un video medido, propón esos valores.
- ¿Cuántas palabras por subtítulo? ¿Mayúsculas o minúsculas? ¿Marcan una palabra del gancho?

Guarda los valores exactos en `estilo.json`.

### 6. Imagen en pantalla

- ¿Qué lleva cada formato: capturas, clips, animaciones o memes?
- ¿Cuánto se ve tu cara? ¿Cómo es el plano del cierre?
- ¿Qué colores y tipografías usas? ¿Qué no quieres ver nunca?

### 7. Audio

- ¿Volumen? Sugiere −14 LUFS.
- ¿Música? ¿Efectos de sonido?

### 8. Autonomía y entrega

- ¿Dónde está el material de cada reel? ¿Dónde va el reel terminado?
- ¿Qué puede hacer Claude sin preguntar? ¿Qué tiene que consultar siempre?
- ¿Cómo marcas los cambios? ¿Cuánto detalle quieres en el mensaje de entrega?

Pregunta siempre por el material de terceros. El usuario decide qué tiene permiso de usar.

## Prueba

1. Pide una grabación de unos 30 segundos.
2. Edítala con el flujo de `SKILL.md`. Deja las animaciones para más adelante.
3. Avísale al usuario: "La primera versión va a tener errores. Marca cada uno. Cada error se vuelve una regla."
4. Sigue el paso "Corregir y aprender" de `SKILL.md`.
