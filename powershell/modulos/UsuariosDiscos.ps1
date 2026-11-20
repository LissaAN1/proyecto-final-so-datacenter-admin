# Modulo de Persona 1: opciones 1 (usuarios y ultimo login) y 2 (discos y filesystems)

function Mostrar-Usuarios {
    Clear-Host
    Write-Host "=============================================="
    Write-Host " USUARIOS DEL SISTEMA Y ULTIMO LOGIN"
    Write-Host "=============================================="
    Write-Host ""

    try {
        $usuarios = @(Get-LocalUser | Select-Object Name, LastLogon)

        foreach ($usuario in $usuarios) {
            if ($null -eq $usuario.LastLogon) {
                $ultimoLogin = "Nunca ha iniciado sesion"
            } else {
                $ultimoLogin = $usuario.LastLogon
            }

            Write-Host "Usuario: $($usuario.Name)"
            Write-Host "Ultimo login: $ultimoLogin"
            Write-Host "----------------------------------------------"
        }
    }
    catch {
        Write-Host "Error al obtener los usuarios del sistema."
        Write-Host "Detalle: $_"
    }

    Pausar
}

function Mostrar-Discos {
    Clear-Host
    Write-Host "=============================================="
    Write-Host " DISCOS / FILESYSTEMS CONECTADOS"
    Write-Host "=============================================="
    Write-Host ""

    try {
        $discos = @(Get-CimInstance Win32_LogicalDisk | Select-Object DeviceID, VolumeName, DriveType, Size, FreeSpace)

        foreach ($disco in $discos) {
            switch ($disco.DriveType) {
                2 { $tipo = "Removible / USB" }
                3 { $tipo = "Disco local" }
                4 { $tipo = "Unidad de red" }
                5 { $tipo = "CD/DVD" }
                default { $tipo = "Otro" }
            }

            Write-Host "Unidad: $($disco.DeviceID)"
            Write-Host "Nombre: $($disco.VolumeName)"
            Write-Host "Tipo: $tipo"
            Write-Host "Tamano total: $($disco.Size) bytes"
            Write-Host "Espacio libre: $($disco.FreeSpace) bytes"
            Write-Host "----------------------------------------------"
        }
    }
    catch {
        Write-Host "Error al obtener los discos conectados."
        Write-Host "Detalle: $_"
    }

    Pausar
}
