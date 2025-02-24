#!/bin/bash

# Script de gestion des processus sous Linux
# Description : Ce script liste les processus en cours selon un critère donné.
# Code de retour :
#  0 - Succès
#  3 - Nombre d'arguments invalide

# Vérifier le nombre d'arguments
if [ $# -gt 1 ]; then
    echo "Utilisation : $0 [nom_process]"
    exit 3
fi

# Déterminer le critère de recherche
if [ $# -eq 1 ]; then
    crit="$1"
elif [ $# -eq 0 ]; then
    read -p "Entrez le nom du processus à rechercher (appuyez sur Entrée pour utiliser votre identifiant utilisateur) : " crit
    if [ -z "$crit" ]; then
        crit=$(whoami)
    fi
fi

# Afficher l'en-tête
echo "USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND"

# Rechercher et afficher les processus correspondants
ps aux | grep -i "$crit" | grep -v "grep"

# Afficher le message de fin avec l'heure actuelle
echo "$(date +'%H:%M:%S') — Fin de traitement"