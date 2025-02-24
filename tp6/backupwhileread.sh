#!/bin/bash

# Définition des variables
backup_dir="backup"  # Dossier où seront stockées les sauvegardes
log_file="backup.log" # Fichier journal
success_count=0
error_count=0

# Création du dossier de sauvegarde s'il n'existe pas
mkdir -p "$backup_dir"

# Ajout de l'horodatage de début
echo "$(date '+%Y-%m-%d %H:%M:%S') Démarrage de la sauvegarde" >> "$log_file"

# Parcours des fichiers .sh du répertoire courant
while IFS= read -r file; do
    cp "$file" "$backup_dir/"
    
    if [ $? -eq 0 ]; then
        echo "$file OK" >> "$log_file"
        ((success_count++))
    else
        echo "$file ECHEC" >> "$log_file"
        ((error_count++))
    fi
done < <(ls *.sh 2>/dev/null)

# Ajout de l'horodatage de fin
echo "$(date '+%Y-%m-%d %H:%M:%S') FIN" >> "$log_file"

# Affichage du résumé
echo "Nombre de fichiers sauvegardés avec succès : $success_count"
echo "Nombre d’échecs : $error_count"