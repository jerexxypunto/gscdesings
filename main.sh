# Copia todo lo que esta en la carpeta dist en el directorio raíz del repositorio
cp -r dist/* "$repo_root" || fail 'No se pudo copiar los archivos de dist al directorio raíz del repositorio.'

# Elimina la carpeta dist después de copiar los archivos
rm -rf dist || fail 'No se pudo eliminar la carpeta dist después de copiar los archivos.'

# Asegurate que esta en la rama main antes de hacer push.
git checkout main || fail 'No se pudo cambiar a la rama main.'

# Agrega todos los cambios al área de preparación
git add -A || fail 'No se pudo agregar los cambios al área de preparación.'

# Verifica si hay cambios para hacer commit
if ! git diff --cached --quiet; then
    # Crea un commit con un mensaje específico
    git commit -m 'chore: commit de seguridad' || fail 'No se pudo crear el commit de seguridad.'
fi

# Empuja los cambios a la rama main en el remoto origin
git push -u origin main || fail 'No se pudo publicar la rama main en origin.'