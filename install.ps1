# Comprobar si Python está instalado
$pythonInstalled = Get-Command python -ErrorAction SilentlyContinue
if (-not $pythonInstalled) {
    Write-Host "Python no está instalado. Por favor, instala Python antes de continuar."
    Read-Host "Presiona Enter para salir"
    exit
}

# Comprobar si Git está instalado
$gitInstalled = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitInstalled) {
    Write-Host "Git no está instalado. Por favor, instala Git antes de continuar."
    Read-Host "Presiona Enter para salir"
    exit
}

# Crear el script CMD
$cmdScript = @"
cd C:\
git clone --branch test https://github.com/franklingutierrez/ollama_gui2.git
cd ollama_gui2
python -m pip install -r requirements.txt
python ollama.py
pause
"@

# Guardar el script CMD
$cmdScriptPath = "C:\run_script.cmd"
Set-Content -Path $cmdScriptPath -Value $cmdScript

# Ejecutar el script CMD
Start-Process cmd -ArgumentList "/c $cmdScriptPath"

Write-Host "Script CMD ejecutado. Revisa la ventana de CMD."
Read-Host "Presiona Enter para salir"
