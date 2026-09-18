#!/bin/bash

# Script para gestionar matriculas de alumnos


agregar_alumno(){
    echo -e "\nAGREGAR ALUMNO\n"

    read -p "Ingresa el NOMBRE del estudiante: " nombre curso
    read -p "Ingresa el CURSO del estudiante: "  curso
    
    if [ ! -f "alumnos.csv" ]; then
        echo "ID,NOMBRE,CURSO" > alumnos.csv
    fi

    total_lineas=$(wc -l < alumnos.csv)
    id=$((total_lineas))
    

    echo "$id,$nombre,$curso" >> alumnos.csv
    echo "✅ Alumno registrado con éxito con el ID: " $id
}


listar_alumnos(){
    echo -e "\nLISTAR ALUMNOS\n"

    if [ ! -f alumnos.csv ] || [ "$(wc -l < alumnos.csv)" -eq 1 ]; then
        echo "⚠️  No hay alumnos registrados." 
    else
        #tail -n +2 alumnos.csv
        column -s, -t alumnos.csv
    fi
}

buscar_alumno(){
    echo -e "\nBUSCAR ALUMNO\n"

    read -p "Indica el ID del alumno: " id_buscado

    

    resultado=$(grep "^$id_buscado," alumnos.csv)

    if [ -z "$resultado" ]; then
        echo -e "\n⚠️ Alumno no encontrado con ID: $id_buscado\n"
    else
        echo -e "\n🎉 ¡Alumno encontrado!\n"
        echo "ID,NOMBRE,CURSO"
        echo $resultado
    fi
}

while true; do

cat << 'EOF'
        
        ========================== GESTIÓN DE ALUMNOS ==========================
        1) Agregar alumno
        2) Listar alumnos
        3) Buscar alumno por ID
        4) Salir

EOF

    read -p "Elige una opción [1-4]: " opcion


    case "$opcion" in
        1)
            agregar_alumno
            ;;
        2)
            listar_alumnos
            ;;
        3)
            buscar_alumno
            ;;
        4) 
            echo "👋 ¡Hasta luego!"
            break
            ;;
        *)
            echo -e "\n 🚨 Opción inválida. Debes ingresar un número del 1 al 4.\n"
            ;;
    esac
done


