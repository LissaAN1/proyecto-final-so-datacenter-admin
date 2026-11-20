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
