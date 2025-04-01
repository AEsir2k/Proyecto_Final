#!/bin/bash

# Función para mostrar el menú
mostrar_menu() {
    echo "Seleccione una opción:"
    echo "1) Crear estructura de usuarios y permisos"
    echo "2) Generar y analizar logs"
    echo "3) Crear backup de directorios críticos (simulado)"
    echo "4) Mostrar espacio disponible en disco"
    echo "5) Limpiar archivos temporales viejos"
    echo "6) Salir"
}

# Función para crear backups
crear_backup() {
    tar -czf ./respaldo/backup_$(date +%F).tar.gz /tmp/empresa/
    echo "Backup creado exitosamente."
}

# Función para mostrar espacio en disco
mostrar_espacio() {
    df -h
}

# Función para limpiar archivos temporales viejos
limpiar_archivos() {
    find /tmp -type f -mtime +7 -exec rm -f {} \;
    echo "Archivos temporales eliminados."
}

# Menú interactivo
while true; do
    mostrar_menu
    read -p "Opción: " opcion

    case $opcion in
        1)
            bash ./scripts/usuarios.sh
            ;;
        2)
            bash ./scripts/logs.sh
            ;;
        3)
            crear_backup
            ;;
        4)
            mostrar_espacio
            ;;
        5)
            limpiar_archivos
            ;;
        6)
            echo "Saliendo..."
            break
            ;;
        *)
            echo "Opción inválida. Intente de nuevo."
            ;;
    esac
done
