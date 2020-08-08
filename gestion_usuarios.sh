#!/bin/bash
#Programa para gestionar usuarios.
#Autor: Barckcode

OPTIONS=0
USER=""

#Menu de opciones:
    echo "_____________________________________________________"
    echo "          Programa de Gestion de Usurios             "
    echo "_____________________________________________________"
    echo "                 MENU PRINCIPAL                      "
    echo "_____________________________________________________"
    echo "1. Verificar si un Usuario Existe."
    echo "2. Crear Usuarios."
    echo "3. Eliminar Usuarios."
    echo "4. Añadir Usuarios a un Grupo."
    echo "5. Eliminar Usuarios de un Grupo."
    echo "6. Cambiar Password del Usuario."
    echo "7. Verificar si el Usuario Esta Caducado o Bloqueado."
    echo "8. Desbloquear Usuario."
    echo "9. Dar permisos de escalado a root a un Usuario"
    echo "10. Dar permisos de sudo a un Usuario"
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
        read -p "Usuario a eliminar: " USER

        echo "_____________________________________________________"
        echo "              SALIDA DE LOS COMANDOS                 "
        userdel -f -r $USER
        VALIDATION=`echo $?`

        echo "_____________________________________________________"
        echo "                      RESULTADO                      "
        if [[ VALIDATION -eq 0 ]]
        then
            echo "El usuario $USER se ha eliminado correctamente."
        else
            echo "El usuario $USER NO se ha podido eliminar."
        fi
        ;;
    4)
        echo "."
        echo "Has elegio la opcion $OPTIONS"
        echo "."
        echo "*Necesitas permisos para ejecutar esta tarea*"
        echo "."
        read -p "Usuario a añadir en un grupo: " USER
        read -p "Grupo al que añadir al usuario: " GROUP

        echo "_____________________________________________________"
        echo "              SALIDA DE LOS COMANDOS                 "
        usermod -a -G $GROUP $USER
        id $USER
        VALIDATION=`echo $?`

        echo "_____________________________________________________"
        echo "                      RESULTADO                      "
        if [[ VALIDATION -eq 0 ]]
        then
            echo "El usuario $USER se ha añadido correctamente a $GROUP."
        else
            echo "El usuario $USER NO se ha podido añadir a $GROUP."
        fi
        ;;
    5)
        echo "."
        echo "Has elegio la opcion $OPTIONS"
        echo "."
        echo "*Necesitas permisos para ejecutar esta tarea*"
        echo "."
        read -p "Usuario a eliminar del grupo: " USER
        read -p "Grupo del que quitar al usuario: " GROUP

        echo "_____________________________________________________"
        echo "              SALIDA DE LOS COMANDOS                 "
        deluser $USER $GROUP
        id $USER
        VALIDATION=`echo $?`

        echo "_____________________________________________________"
        echo "                      RESULTADO                      "
        if [[ VALIDATION -eq 0 ]]
        then
            echo "El usuario $USER se ha retirado correctamente del grupo $GROUP."
        else
            echo "El usuario $USER NO se ha podido retirar del grupo $GROUP."
        fi
        ;;
    6)
        echo "."
        echo "Has elegio la opcion $OPTIONS"
        echo "."
        echo "*Necesitas permisos para ejecutar esta tarea*"
        echo "."
        read -p "Usuario a cambiar la contraseña: " USER
        read -p "Nueva constraseña: " PASSWORD

        echo "_____________________________________________________"
        echo "              SALIDA DE LOS COMANDOS                 "
        echo -e "$PASSWORD\n$PASSWORD" | passwd $USER
        VALIDATION=`echo $?`

        echo "_____________________________________________________"
        echo "                      RESULTADO                      "
        if [[ VALIDATION -eq 0 ]]
        then
            echo "Se ha modificado la contraseña del usuario $USER correctamente"
        else
            echo "NO se ha podido modificar la contraseña del usuario $USER"
        fi
        ;;
    7)
        echo "."
        echo "Has elegio la opcion $OPTIONS"
        echo "."
        echo "*Necesitas permisos para ejecutar esta tarea*"
        echo "."
        ;;
    8)
        echo "."
        echo "Has elegio la opcion $OPTIONS"
        echo "."
        echo "*Necesitas permisos para ejecutar esta tarea*"
        echo "."
        ;;
    9)
        echo "."
        echo "Has elegio la opcion $OPTIONS"
        echo "."
        echo "*Necesitas permisos para ejecutar esta tarea*"
        echo "."
        ;;
    10)
        echo "."
        echo "Has elegio la opcion $OPTIONS"
        echo "."
        echo "*Necesitas permisos para ejecutar esta tarea*"
        echo "."
        ;;
    11)
        echo "."
        echo "Has elegio la opcion $OPTIONS"
        echo "."
        echo "*Necesitas permisos para ejecutar esta tarea*"
        echo "."
        ;;
    *)
        echo "ERROR: No has elegido ninguna opcion disponible."
        ;;
esac