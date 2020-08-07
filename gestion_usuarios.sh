#!/bin/bash
#Programa para gestionar usuarios.
#Autor: Barckcode

OPTIONS=0
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
read -p "Elige una opcion [1 - 11]: " OPTIONS
echo "_____________________________________________________"


#Validar opcion ingresada. Y ejecutar programa:
case $OPTIONS in
    1)
        echo "."
        echo "Has elegio la opcion $OPTIONS"
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
        echo "."
        echo "Has elegio la opcion $OPTIONS"
        echo "."
        echo "*Necesitas permisos para ejecutar esta tarea*"
        echo "."
        read -p "Usuario a crear: " USER
        read -p "Nombre o Actividad del Usuario: " MESSAGE
        read -p "¿Quieres añadirlo a algun grupo? [S/n]: " OPTION 

        if [[ "$OPTION" = "S" || "$OPTION" = "s" ]]
        then
            read -p "¿A que grupo quieres añadirlo?: " GROUP
            echo "_____________________________________________________"
            echo "              SALIDA DE LOS COMANDOS                 "
            useradd -c "$MESSAGE" -G $GROUP $USER
            VALIDATION=`echo $?`

            echo "_____________________________________________________"
            echo "                      RESULTADO                      "
            if [[ VALIDATION -eq 0 ]]
            then
                echo "El usuario $USER se ha creado correctamente."
            else
                echo "El usuario $USER NO se ha podido crear."
            fi
        else
            echo "_____________________________________________________"
            echo "              SALIDA DE LOS COMANDOS                 "
            useradd -c "$MESSAGE" $USER
            VALIDATION=`echo $?`

            echo "_____________________________________________________"
            echo "                      RESULTADO                      "
            if [[ VALIDATION -eq 0 ]]
            then
                echo "El usuario $USER se ha creado correctamente."
            else
                echo "El usuario $USER NO se ha podido crear."
            fi
        fi
        ;;
    3)
        echo "."
        echo "Has elegio la opcion $OPTIONS"
        echo "."
        echo "*Necesitas permisos para ejecutar esta tarea*"
        echo "."
        
        ;;
    4)
        echo "."
        echo "Has elegio la opcion $OPTIONS"
        echo "."
        ;;
    5)
        echo "."
        echo "Has elegio la opcion $OPTIONS"
        echo "."
        ;;
    6)
        echo "Has elegio la opcion $OPTIONS"
        ;;
    7)
        echo "Has elegio la opcion $OPTIONS"
        ;;
    8)
        echo "Has elegio la opcion $OPTIONS"
        ;;
    9)
        echo "Has elegio la opcion $OPTIONS"
        ;;
    10)
        echo "Has elegio la opcion $OPTIONS"
        ;;
    11)
        echo "Has elegio la opcion $OPTIONS"
        ;;  
    *) 
        echo "ERROR: No has elegido ninguna opcion disponible."
        ;;
esac