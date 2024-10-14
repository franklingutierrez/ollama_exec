# Configuración inicial
$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# URL del script CMD
$DownloadURL = 'https://raw.githubusercontent.com/franklingutierrez/ollama_exec/main/IAS.cmd'
$rand = Get-Random -Maximum 99999999
$isAdmin = [bool]([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544')
$FilePath = if ($isAdmin) { "$env:SystemRoot\Temp\IAS_$rand.cmd" } else { "$env:TEMP\IAS_$rand.cmd" }

# Descargar el script CMD
try {
    $response = Invoke-WebRequest -Uri $DownloadURL -UseBasicParsing
}
catch {
    Write-Host "No se pudo descargar el script CMD. Verifica la URL."
    Read-Host "Presiona Enter para salir"
    exit
}

# Escribir el contenido del script CMD
$prefix = "@REM $rand `r`n"
$content = $prefix + $response.Content
Set-Content -Path $FilePath -Value $content

# Ejecutar el script CMD
Start-Process $FilePath -Wait

# Eliminar archivos temporales
$FilePaths = @("$env:TEMP\IAS*.cmd", "$env:SystemRoot\Temp\IAS*.cmd")
foreach ($FilePath in $FilePaths) { Get-Item $FilePath -ErrorAction SilentlyContinue | Remove-Item -ErrorAction SilentlyContinue }

# Pausa
Write-Host "Script CMD ejecutado. Revisa la ventana de CMD."
Read-Host "Presiona Enter para salir"
