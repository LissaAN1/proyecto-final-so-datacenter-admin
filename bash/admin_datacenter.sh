#!/bin/bash

# ==========================================================
# Herramienta de Administracion de Data Center - BASH
# Sistemas Operacionales - Universidad Icesi
# Archivo principal: menu y ciclo de ejecucion (Persona 1)
# ==========================================================

DIR_SCRIPT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Modulos (cada uno pertenece a un integrante del grupo)
source "$DIR_SCRIPT/modulos/usuarios_discos.sh"
source "$DIR_SCRIPT/modulos/archivos_memoria.sh"
source "$DIR_SCRIPT/modulos/backup_usb.sh"

pausar() {
    echo ""
    read -r -p "Presione ENTER para volver al menu"
}


mostrar_menu() {
    clear
    echo "=============================================="
    echo " HERRAMIENTA DE ADMINISTRACION DATA CENTER"
    echo "=============================================="
    echo "1. Desplegar usuarios creados y ultimo login"
    echo "2. Desplegar filesystems o discos conectados"
    echo "3. Mostrar los 10 archivos mas grandes"
    echo "4. Mostrar memoria libre y swap en uso"
    echo "5. Hacer backup de un directorio a USB"
    echo "6. Salir"
    echo "=============================================="
}

opcion=""

while [ "$opcion" != "6" ]; do
    mostrar_menu
    read -r -p "Seleccione una opcion: " opcion

    case $opcion in
        1) mostrar_usuarios ;;
        2) mostrar_discos ;;
        3) mostrar_archivos_grandes ;;
        4) mostrar_memoria_swap ;;
        5) hacer_backup ;;
        6)
            clear
            echo "Saliendo de la herramienta..."
            ;;
        *)
            clear
            echo "Opcion no valida. Intente nuevamente."
            pausar
            ;;
    esac
done
