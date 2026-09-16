#!/bin/bash
{
echo  "DATE: $(date)"
echo "USER: $(whoami)"
echo -e "HOSTNAME: $(hostname) \n"

df -h| awk 'NR>1 {print $5, $6}' | sed 's/%/ /' | while read -r usage mountpoint; do
    if [ "$usage" -gt 70 ]; then
        echo " 🚨 Warning: $mountpoint is ${usage}% full."
    else
        echo " ✅ $mountpoint is ${usage}% full."
    fi
done 

echo -e "\n🔚 FIN DE LA VALIDACIÓN DE ESPACIO EN DISCO \n"

} >> output.txt

echo "🟢 ¡Proceso terminado! El resultado se guardó en output.txt"






