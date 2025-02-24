#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Syntaxe : $0 <prenom> <nom>"
    echo "$(date) - Erreur : Nombre d'arguments incorrect" >> error.log
    exit 1
fi
echo "Bonjour $1 $2 Il est $(date +"%H:%M"), bienvenue sur $(hostname)"