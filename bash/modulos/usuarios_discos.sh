# Modulo de Persona 1: opciones 1 (usuarios y ultimo login) y 2 (discos y filesystems)

mostrar_usuarios() {
    clear
    echo "=============================================="
    echo " USUARIOS DEL SISTEMA Y ULTIMO LOGIN"
    echo "=============================================="
    echo ""

    # Solo usuarios reales: root (UID 0) y usuarios normales (UID >= 1000)
    usuarios=$(awk -F: '$3 == 0 || ($3 >= 1000 && $3 < 65534) {print $1}' /etc/passwd)

    if command -v lastlog >/dev/null 2>&1; then
        lastlog | head -1
        for usuario in $usuarios; do
            lastlog -u "$usuario" | tail -n +2
        done
    else
        echo "El comando lastlog no esta disponible en este sistema."
        echo ""
        echo "Usuarios encontrados en /etc/passwd:"
        echo "$usuarios"
    fi

    pausar
}
