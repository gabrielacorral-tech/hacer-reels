# Lecciones de edición

Estos errores aparecieron editando reels reales. Valen para cualquier creador.

## Voz y cortes

- Whisper sobre el audio entero junta las frases repetidas. Transcribe tramo por tramo. `transcribir.py` ya lo hace.
- Whisper inventa texto sobre los silencios. Antes de sacar una toma, mide la energía del audio en ese tramo.
- Una frase dicha en voz baja puede caer debajo del umbral. Compara cada frase con el guion.
- Un corte puede comerse el final de una palabra. Mide el volumen en ventanas de 50 ms después del corte. Si sigue alto, alarga el tramo.
- Una persona a veces repite solo el remate o una pregunta corta. Escucha esas frases aunque no haya alerta.
- Whisper ubica mal las palabras después de un silencio largo. Transcribe el audio editado, no el crudo.
- Un plano a cámara cerca de un corte puede mostrar un destello de otra toma. Mueve el borde del plano al corte.
- El final del crudo suele mostrar a la persona yendo a apagar la cámara. Mira siempre `cola.jpg`.

## Pantalla

- Una zona negra o vacía grande es un error. Revisa cada plano en la hoja de cuadros.
- Una captura más ancha que alta no llena el 9:16. Pégala sobre una página alta o acerca la parte que nombra la voz.
- Muchos clips 4:3 traen bandas negras dentro de un 16:9. Mide el área útil y recorta.
- Un resalte debajo del subtítulo no se lee. Sube el contenido antes de armar.
- Elige el momento de un clip por su diálogo, no por el nombre del archivo.

## Subtítulos

- La letra blanca se pierde sobre fondos claros y ropa con rayas. Prueba el borde sobre esos cuadros.
- Un borde muy marcado también molesta. Muestra alternativas sobre cuadros reales.
- Whisper pone tilde de más en cómo, qué, cuándo y dónde. Lee cada línea.
- Whisper entiende mal marcas y nombres. Guárdalos en `correcciones` de `estilo.json`.
- Una palabra sola y breve parpadea. Júntala con la anterior.

## Imagen de la cámara

- Una grabación HDR de celular sale lavada o quemada si la tratas como SDR. `cortar_silencios.py` la convierte.
- Un color medido para una cámara no sirve para otra.
- Una cámara puede repetir o congelar cuadros. Si la cara se traba, tapa ese tramo con un inserto o pide regrabar la frase.

## Audio

- Instagram no publica una cifra de volumen. Las guías para Reels y TikTok usan −14 LUFS como referencia.
- Subir solo la ganancia satura los picos. Nivela con `armar.py`.

## Render

- Dos procesos en la misma carpeta de trabajo pueden chocar. Ejecuta un armado por vez.
- En animaciones, un índice negativo en JavaScript rompe un solo cuadro. Normaliza con `((n % m) + m) % m`.
- Cambia el nombre de la salida en cada versión. Una corrección nunca pisa lo ya entregado.
