#!/bin/bash

echo ""

printf "menu :\n\n"
     echo "1. Installer tout les paquets"
     echo "2. Selectionner les paquets à installer"
     echo "3. Quit: pour quitter le programme\n"
     echo ""
     echo "==========================================================================="
     echo ""

function dependance {
echo ""
read -p "Voulez vous rêgler les dépendances des paquets ?? [o/n] (connexion requise) : " dep

if [ "$dep" = "o" ];then
sudo apt update   
sudo apt-get -f install
sudo apt --fix-broken install  
else
echo "Good bye !"
fi
}

function dommage {
if [[ $1 =~ ^[0-9]+$ ]]; then
echo ""
else
printf "\n=========================================================================\n"
echo -e "DOMMAGE !!!, reprennez en saisissant uniquement des chiffres"
printf "=========================================================================\n\n"
exit
fi
}

choix=9
while  (( $choix <= 0 || $choix>3 )) 
do
read -p "Saisissez votre choix suivant le menu (choisissez un chiffre !!!): " choix
dommage $choix
if (( $choix<=0 || $choix>3 )); then
echo "Le choix doit être dans l'intervale de [1,3]"
fi
done

if [ "$choix" = "1" ];then

cd /home/`users`/Téléchargements

git clone https://github.com/Ben-musampa/Unikin_package

sleep 5

cd Unikin_package/package/


echo " "
echo "Voici la liste des nos fichiers, veuillez saisir le numéro de(s) fichier(s) pour les installés : "
echo " "

compt=0;

for entry in `ls $search_dir`; do
    echo $entry
    compt=$((compt +1));
done

if ls *.deb >/dev/null 2>&1;then

sudo dpkg -i `find . -type f -name '*.deb'` 

dependance

printf "\n=========================================================================\n"
echo "Felicitation !!!"
printf "=========================================================================\n\n"

rm -r Unikin_package/
fi

elif [ "$choix" = "2" ]; then

cd /home/`users`/Téléchargements

git clone https://github.com/Ben-musampa/Unikin_package

sleep 5

cd Unikin_package/package/

echo " "
echo "Voici la liste des nos fichiers, veuillez saisir le numéro de(s) fichier(s) pour les installés : "
echo " "

compt=0;

for entry in `ls $search_dir`; do
    echo $entry
    compt=$((compt +1));
done

echo ""
read -p "Veuillez saisir le nombre des fichiers à installer :" nbr
dommage $nbr

while  (( $nbr <= 0 || $nbr>$compt )) 
do
read -p "Ressaisissez le nombre des paquets à installer :" nbr
echo ""
dommage $nbr
if (( $nbr<=0 || $nbr>$compt )); then
echo " Le nombre des paquets doit être soit 1, soit inférieur à $compt+1. c_à_d [1, $compt+1["
echo ""
fi
done

echo " "
echo "==========================================================================="
echo "Veuillez saisir $nbr choix (saisissez uniquement des chiffres !!!): "
echo " "
while true; do
for ((i= 1; i <=$nbr; i++)); do

read -p "Paquet $i :" val
dommage $val

while [[ $val -lt 0 || $val -gt $compt ]]; do
echo ""
echo "le numéro du paquet doit être compris entre 1 et $compt; c_à_d [1,$compt]"
echo "L'un de numéro n'est pas dans l'intervalle, Veuillez reprendre !!"
echo ""
echo "==========================================================================="
read -p "Paquet $i :" val
dommage $val

done
tt[$i]=$val
done

break
done

echo "==========================================================================="
echo " "
echo "Votre choix se porte sur le(s) paquets(s) :"
echo ""

for s in ${tt[*]}; do

find . -type f -name "*-$s.deb"

done
echo ""
echo "==========================================================================="
echo ""
cd /home/`users`/

k="tAmponss";

if [[ -d "$k" ]]; then

for s in ${tt[*]}; do

cd /home/`users`/Téléchargements/Unikin_package/package/

cp -v `find . -type f -name "*-$s.deb"` /home/`users`/tAmponss

done

cd /home/`users`/tAmponss

sudo dpkg -i `find . -type f -name '*.deb'`

cd ..

rm -r tAmponss/

cd /home/`users`/Téléchargements

rm -r Unikin_package/

else

mkdir /home/`users`/tAmponss

for s in ${tt[*]}; do

cd /home/`users`/Téléchargements/Unikin_package/package/

cp -v `find . -type f -name "*-$s.deb"` /home/`users`/tAmponss

done

cd /home/`users`/tAmponss

sudo dpkg -i `find . -type f -name '*.deb'`
dependance

cd ..

rm -r tAmponss/

cd /home/`users`/Téléchargements

rm -r Unikin_package/
fi

printf "\n=========================================================================\n"
echo "Felicitation !!!"
printf "=========================================================================\n\n"

elif [ "$choix" = "3" ]; then
printf "\n\n=======================================================================\n"
echo "GOOD BYE !!!"
printf "=========================================================================\n\n"
fi