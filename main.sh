# Guarda todos los cambios en un commit de seguridad.
#git add -A || fail 'No se pudo agregar los cambios al área de preparación.'

# Verifica si hay cambios para hacer commit
#if ! git diff --cached --quiet; then
    # Crea un commit con un mensaje específico
#    git commit -m 'chore: commit de seguridad' || fail 'No se pudo crear el commit de seguridad.'
#fi

# Cambia a la rama main y realiza un commit con un mensaje específico
#git checkout main || fail 'No se pudo cambiar a la rama main.'

# Elimina ficheros .html y carpeta assets en el directorio raíz del repositorio
#find "$repo_root" -maxdepth 1 -type f -name "*.html" -delete || fail 'No se pudo eliminar los archivos .html en el directorio raíz del repositorio.'
#find "$repo_root/assets" -type f -delete || fail 'No se pudo eliminar los archivos en la carpeta assets del directorio raíz del repositorio.'   
# Elimina la carpeta assets en el directorio raíz del repositorio
#rm -rf "$repo_root/assets" || fail 'No se pudo eliminar la carpeta assets en el directorio raíz del repositorio.'

# Realiza un merge de la rama dev con la rama main
#git merge dev || fail 'No se pudo hacer merge de la rama dev con la rama main.'

# Copia todo lo que esta en la carpeta dist en el directorio raíz del repositorio
cp -r dist/* "$repo_root" || fail 'No se pudo copiar los archivos de dist al directorio raíz del repositorio.'

# Elimina la carpeta dist después de copiar los archivos
rm -rf dist || fail 'No se pudo eliminar la carpeta dist después de copiar los archivos.'

# Guardar los cambios en un commit con un mensaje específico
git add -A || fail 'No se pudo agregar los cambios al área de preparación.'
git commit -m 'chore: commit de seguridad' || fail 'No se pudo crear el commit de seguridad.'

# Empuja los cambios a la rama main en el remoto origin
git push -u origin main || fail 'No se pudo publicar la rama main en origin.'