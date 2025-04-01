#!/bin/bash

# Crear un archivo de logs simulado
LOG_FILE="./logs/eventos.log"

# Generar 30 entradas en el log
for i in {1..30}; do
    RANDOM_EVENT=$(shuf -e INFO WARNING ERROR LOGIN BACKUP -n 1)
    echo "$(date) $RANDOM_EVENT Event number $i" >> $LOG_FILE
done

# Análisis de logs
echo "Análisis de logs:"
echo "-----------------"

# Número de errores
ERRORS=$(grep -c "ERROR" $LOG_FILE)
echo "Número de errores: $ERRORS"

# Últimos 5 errores
echo "Últimos 5 errores:"
grep "ERROR" $LOG_FILE | tail -n 5

# Mensajes más frecuentes
echo "Mensajes más frecuentes:"
awk '{print $3}' $LOG_FILE | sort | uniq -c | sort -nr

# Usuarios con más actividad
echo "Usuarios con más actividad:"
awk '{print $3}' $LOG_FILE | sort | uniq -c | sort -nr | head -n 5
