#!/bin/bash
#Programa para gestionar usuarios.
#Autor: Barckcode

OPTION=0
USER=""

#Menu de opciones:
    echo "_____________________________________________________"
    echo "             Programa de Gestion de Usurios          "
    echo "_____________________________________________________"
    echo "                 MENU PRINCIPAL                      "
    echo "_____________________________________________________"
    echo "1. Verificar si un Usuario Existe."
    echo "2. Crear Usuarios."
    echo "3. Eliminar Usuarios."
    echo "4. Añadir Usuarios a un Grupo."
    echo "5. Eliminar Usuarios de un Grupo."
    echo "7. Cambiar Password del Usuario."
    echo "8. Verificar si el Usuario Esta Caducado o Bloqueado."
    echo "9. Desbloquear Usuario."
    echo "10. Dar permisos de escalado a root a un Usuario"
    echo "11. Dar permisos de sudo a un Usuario"
    echo "_____________________________________________________"

#Leer opcion elegida por el usuario:
read -p "Elige una opcion [1 - 11]: " OPTION
echo "_____________________________________________________"


#Validar opcion ingresada. Y ejecutar programa:
case $OPTION in
    1)
        echo "."
        echo "Has elegio la opcion $OPTION"
        echo "."
        read -p "Usuario a comprobar: " USER
        echo "_____________________________________________________"
        echo "              SALIDA DE LOS COMANDOS                 "
        id $USER
        VALIDATION=`echo $?`

        echo "_____________________________________________________"
        echo "                      RESULTADO                      "
        if [[ VALIDATION -eq 0 ]]
        then
            echo "El usuario $USER existe en el sistema."
        else
            echo "El usuario $USER NO existe en el sistema"
        fi
        ;;
    2)
        echo "Has elegio la opcion $OPTION"
        ;;
    3)
        echo "Has elegio la opcion $OPTION"
        ;;
    4)
        echo "Has elegio la opcion $OPTION"
        ;;
    5)
        echo "Has elegio la opcion $OPTION"
        ;;
    6)
        echo "Has elegio la opcion $OPTION"
        ;;
    7)
        echo "Has elegio la opcion $OPTION"
        ;;
    8)
        echo "Has elegio la opcion $OPTION"
        ;;
    9)
        echo "Has elegio la opcion $OPTION"
        ;;
    10)
        echo "Has elegio la opcion $OPTION"
        ;;
    11)
        echo "Has elegio la opcion $OPTION"
        ;;  
    *) 
        echo "ERROR: No has elegido ninguna opcion disponible."
        ;;
esac