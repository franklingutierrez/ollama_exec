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
cd C:\ollama_gui2\ollama_gui2-main
python -m pip install -r requirements.txt
git checkout test
python ollama.py
pause
"@

# Guardar el script CMD
$cmdScriptPath = "C:\ollama_gui2\run_script.cmd"
Set-Content -Path $cmdScriptPath -Value $cmdScript

# Clonar el repositorio correcto
Invoke-RestMethod -Uri "https://github.com/franklingutierrez/ollama_gui2/archive/refs/heads/main.zip" -OutFile "C:\ollama_gui2.zip"
Expand-Archive -LiteralPath "C:\ollama_gui2.zip" -DestinationPath "C:\ollama_gui2"

# Ejecutar el script CMD
Start-Process cmd -ArgumentList "/c $cmdScriptPath"
