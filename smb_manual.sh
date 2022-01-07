#!/bin/bash

echo ""
echo "SMB MANUAL"
echo ""

opcion="ninguna"

function opcion1
{

echo ""
echo -e "\e[33m Ingrese la IP victima \e[0m"
echo ""
read ip

echo ""
echo -e "\e[33m -------------------------------------------------------- \e[0m"
echo ""

smbmap -H $ip

   read
   return 0

}

function opcion2
{

echo ""
echo -e "\e[33m Ingrese la IP victima \e[0m"
echo ""
read ip

echo ""
echo -e "\e[33m Ingrese el usuario \e[0m"
echo ""
read user

echo ""
echo -e "\e[33m Ingrese el password \e[0m"
echo ""
read passwd

echo ""
echo -e "\e[33m -------------------------------------------------------- \e[0m"
echo ""

smbmap -u $usuario -p $passwd -H $ip

   read
   return 0

}

function opcion3
{

echo ""
echo -e "\e[33m Ingrese la IP victima \e[0m"
echo ""
read ip

echo ""
echo -e "\e[33m Ingrese la ruta \e[0m - \e[33m Ejemplo: tmp - opt - anonymous -or- tmp/ruta \e[0m"
echo ""
read ruta

echo ""
echo -e "\e[33m -------------------------------------------------------- \e[0m"
echo ""

smbclient //$ip/$ruta

   read
   return 0

}

function opcion4
{

echo ""
echo -e "\e[33m Ingrese la IP victima \e[0m"
echo ""
read ip

echo ""
echo -e "\e[33m Ingrese la ruta \e[0m - \e[33m Ejemplo: tmp - opt - anonymous -or- tmp/ruta \e[0m"
echo ""
read ruta

echo ""
echo -e "\e[33m -------------------------------------------------------- \e[0m"
echo ""

smbclient -N //$ip/$ruta

   read
   return 0

}

function opcion5
{

echo ""
echo -e "\e[33m Ingrese la IP victima \e[0m"
echo ""
read ip

echo ""
echo -e "\e[33m Ingrese la ruta \e[0m - \e[33m Ejemplo: tmp - opt - anonymous -or- tmp/ruta \e[0m"
echo ""
read ruta

echo ""
echo -e "\e[33m -------------------------------------------------------- \e[0m"
echo ""

smbclient -L //$ip/$ruta

   read
   return 0

}

function opcion6
{

echo ""
echo -e "\e[33m Ingrese la IP victima \e[0m"
echo ""
read ip

echo ""
echo -e "\e[33m Ingrese la ruta \e[0m - \e[33m Ejemplo: tmp - opt - anonymous -or- tmp/ruta \e[0m"
echo ""
read ruta

echo ""
echo -e "\e[33m -------------------------------------------------------- \e[0m"
echo ""

smbget -R smb://$ip/$ruta

   read
   return 0

}



while [ $opcion != "7"  ]
    do

echo ""

	echo -e "\e[31m \n	-- MENU -- \e[0m"
	echo ""
	echo -e "\t1) SMBMAP Reconocimiento de archivos compartidos (NO PASS)"------------------------"smbmap -H <ip>"
	echo -e "\t2) SMBMAP Reconocimiento de archivos compartidos (USER y PASS)"--------------------"smbmap -u usuario -p passwd -H <ip>"
	echo -e "\t3) SMBCLIENT"----------------------------------------------------------------------"smbclient //<ip>/ruta"
	echo -e "\t4) SMBCLIENT con SESSIONES NULAS"--------------------------------------------------"smbclient -N //<ip>/ruta"
        echo -e "\t5) SMBCLIENT (PASS)"---------------------------------------------------------------"smbclient -L //<ip>/ruta"
        echo -e "\t6) SMBGET Copiar una ruta recursivamente (-R)"-------------------------------------"smbget -R smb://<ip>/ruta"
	echo -e "\t7) Salir\n"
	echo -e "\e[33m \tOpcion: \c \e[0m"

read opcion

echo -e "\e[33m -------------------------------------------------------------  \e[0m"

        if [ -z $opcion ] ; then opcion="ninguna" ; fi

        case $opcion in
		"1" )
                      opcion1
  		      ;;
		"2" )
		      opcion2
		      ;;
                "3" )
                      opcion3
                      ;;
		"4" )
                      opcion4
                      ;;
                "5" )
                      opcion5
                      ;;
                "6" )
                      opcion6
                      ;;
		"*" )
		      ;;

	esac


	/usr/bin/clear
done
