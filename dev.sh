#!/usr/bin/env bash
set -Eeuo pipefail

fail() {
	printf 'Error: %s\n' "$1" >&2
	exit 1
}

command -v git >/dev/null 2>&1 || fail 'Git no está instalado.'
repo_root=$(git rev-parse --show-toplevel 2>/dev/null) || fail 'El directorio actual no pertenece a un repositorio Git.'
cd "$repo_root"

git remote get-url origin >/dev/null 2>&1 || fail 'No existe un remoto llamado origin.'
remote_url=$(git remote get-url origin)
printf '%s\n' "$remote_url" | grep -Eiq '(^|[@/])github\.com([/:]|$)' || fail 'El remoto origin no apunta a GitHub.'
git ls-remote origin >/dev/null 2>&1 || fail 'El repositorio de GitHub no está accesible; revisa la conexión y tus permisos.'

if ! git show-ref --verify --quiet refs/heads/dev; then
	remote_dev=$(git ls-remote origin refs/heads/dev) || fail 'No se pudo comprobar si la rama dev existe en origin.'
	if [[ -n "$remote_dev" ]]; then
		git fetch origin dev || fail 'No se pudo obtener la rama dev desde origin.'
		git checkout --track -b dev origin/dev || fail 'No se pudo crear la rama local dev.'
	else
		git checkout -b dev || fail 'No se pudo crear la rama local dev.'
	fi
else
	git checkout dev || fail 'No se pudo cambiar a la rama local dev.'
fi

git add -A
if ! git diff --cached --quiet; then
	git commit -m 'chore: commit de seguridad' || fail 'No se pudo crear el commit de seguridad.'
fi

git push -u origin dev || fail 'No se pudo publicar la rama dev en origin.'
printf 'Validación completada: rama dev publicada en GitHub.\n'
