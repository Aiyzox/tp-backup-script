#!/bin/bash

# Vérifier si le script est exécuté avec des privilèges sudo (root)
if [ "$(id -u)" -ne 0 ]; then
    echo "Le script doit être exécuté avec sudo. Relancez-le en utilisant : sudo $0"
    exit 1
fi

# Demande des informations
if [ -z "$1" ]; then
    read -p "Quel est la base du nom de compte ? : " base_username
else
    base_username=$1
fi
if [ -z "$2" ]; then
    read -p "Quel est le nombre de comptes a créer ? : " accounts_amount
else
    accounts_amount=$2
fi
if [ -z "$3" ]; then
    read -p "Quel est le numéro de départ (défaut : 1) ? : " base_number
else
    base_number=$3
fi

# Vérifier si la saisie est un nombre valide
if ! [[ "$base_number" =~ ^[0-9]+$ ]]; then
    base_number=1
fi

i=0
success_count=0
error_count=0

while [ $i -le $(( $accounts_amount - 1 )) ]
do
    current_account_number=$(($base_number+$i))
    username=$base_username$current_account_number
    echo "---------------------------------"
    echo "Création du compte $username"
    useradd -m $username
    # Vérifier si la commande useradd a réussi
    if [ $? -eq 0 ]; then
        echo "Le compte $username a été créé avec succès."
        ((success_count++))
    else
        echo "Erreur lors de la création du compte $username."
        ((error_count++))
    fi
    echo "---------------------------------"
    ((i++))
done
echo "---------------------------------------"
echo "Récapitulatif :"
echo "Comptes créés avec succès : $success_count"
echo "Erreurs lors de la création : $error_count"