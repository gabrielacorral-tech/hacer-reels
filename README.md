# Hacer reels

Skill para Claude Code que edita reels verticales de punta a punta: instala las herramientas, aprende tu estilo de videos de referencia, edita con storyboard previo, revisa cada corte y aprende de tus correcciones.

El skill está en [`.claude/skills/reels-completo/`](.claude/skills/reels-completo/). Claude Code lo carga solo al abrir este repo.

## Usar (desde Claude Code)

```bash
git clone https://github.com/gabrielacorral-tech/hacer-reels
cd hacer-reels
claude
```

Y escribí: `instalá las herramientas de edición`, `aprendé este estilo: <links>` o `editá este reel: <archivo>`.

Las correcciones se guardan en el propio repo (`correcciones.md`, `preferencias.md`, `hoja-de-marca.md`), así que se versionan con `git`. Si el repo es público, revisá que no tengan datos personales.

Para usarlo en cualquier carpeta: `cp -r .claude/skills/reels-completo ~/.claude/skills/`.

## Créditos

Basado en el template [editar-mis-reels](https://github.com/alandaitch/editar-mis-reels) de alandaitch (licencia MIT). Se agregaron: instalación de herramientas, hoja de marca, storyboard previo, música y efectos en `armar.py`.
