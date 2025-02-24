#!/bin/bash

# Demande du répertoire d'enregistrement
read -p "Quel est le répertoire d'enregistrement : " folder

# Récuperer l'utilisateur courrant
current_user=($whoami)

#fonction en cas de réussite
function result {
    touch $folder/result.log
    echo "Le fichier $folder/result.log à bien été crée."
}

# Vérification du répertoire
case $folder in
    $(pwd))
    echo "Le répertoire cible et de destination ne peuvent pas être identiques."
    exit 1
    ;;
    
    $HOME)
    echo "C'est le home"
    result
    ;;

    /home/*)
    if [[ "$folder" != "/home/$current_user" ]]; then
        echo "La cible ne peut être enregistrée dans un répertoire utilisateur autre que le vôtre."
        exit 2
    fi
    ;;

    /root*)
    if [[ "$current_user" == "root" ]]; then
        result
    else
        echo "Ce chemin ne peut être utilisé que pour une connexion en ROOT."
        exit 1
    fi
    ;;

    *)
    if [[ -w "$folder" ]]; then
        result
    else
        echo "Vous ne disposez pas des privilèges nécessaires à la création du fichier dans le répertoire demandé."
        exit 1
    fi
    ;;
esac