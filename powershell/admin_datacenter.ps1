# ==========================================================
# Herramienta de Administracion de Data Center - PowerShell
# Sistemas Operacionales - Universidad Icesi
# Archivo principal: menu y ciclo de ejecucion (Persona 1)
# ==========================================================

# Modulos (cada uno pertenece a un integrante del grupo)
. "$PSScriptRoot\modulos\UsuariosDiscos.ps1"
. "$PSScriptRoot\modulos\ArchivosMemoria.ps1"
. "$PSScriptRoot\modulos\BackupUsb.ps1"

function Pausar {
    Write-Host ""
    Read-Host "Presione ENTER para volver al menu"
}

function Mostrar-Menu {
    Clear-Host
    Write-Host "=============================================="
    Write-Host " HERRAMIENTA DE ADMINISTRACION DATA CENTER"
    Write-Host "=============================================="
    Write-Host "1. Desplegar usuarios creados y ultimo login"
    Write-Host "2. Desplegar filesystems o discos conectados"
    Write-Host "3. Mostrar los 10 archivos mas grandes"
    Write-Host "4. Mostrar memoria libre y swap en uso"
    Write-Host "5. Hacer backup de un directorio a USB"
    Write-Host "6. Salir"
    Write-Host "=============================================="
}

do {
    Mostrar-Menu
    $opcion = Read-Host "Seleccione una opcion"

    switch ($opcion) {
        "1" { Mostrar-Usuarios }
        "2" { Mostrar-Discos }
        "3" { Mostrar-ArchivosGrandes }
        "4" { Mostrar-MemoriaSwap }
        "5" { Hacer-Backup }
        "6" {
            Clear-Host
            Write-Host "Saliendo de la herramienta..."
        }
        default {
            Clear-Host
            Write-Host "Opcion no valida. Intente nuevamente."
            Pausar
        }
    }
} while ($opcion -ne "6")
