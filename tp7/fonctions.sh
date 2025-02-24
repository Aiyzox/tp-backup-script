#!/bin/bash

# Importation des fonctions depuis le fichier externe
source fonctions.fonc

# Menu principal
while true; do
    echo ""
    echo "---------------------------------"
    echo "📂 Gestion des fichiers Bash"
    echo "1️⃣ - Sauvegarder les fichiers .sh"
    echo "2️⃣ - Supprimer les fichiers .save"
    echo "3️⃣ - Lister les fichiers"
    echo "4️⃣ - Quitter"
    echo "---------------------------------"
    echo ""
    
    # Lire le choix utilisateur
    read -p "Votre choix : " choix
    
    case $choix in
        1) sauvegarde_fichiers ;;
        2) suppression_fichiers ;;
        3) afficher_fichiers ;;
        4) echo "👋 Au revoir !"; exit 0 ;;
        *) echo "❌ Option invalide, veuillez réessayer." ;;
    esac
done
