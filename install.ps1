# Comprobar si Python está instalado
$pythonInstalled = Get-Command python -ErrorAction SilentlyContinue
if (-not $pythonInstalled) {
    Write-Host "Python no está instalado. Por favor, instala Python antes de continuar."
    exit
}

# Comprobar si Git está instalado
$gitInstalled = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitInstalled) {
    Write-Host "Git no está instalado. Por favor, instala Git antes de continuar."
    exit
}

# Clonar el repositorio
Invoke-RestMethod -Uri "https://github.com/franklingutierrez/ollama_gui2/archive/refs/heads/main.zip" -OutFile "C:\ollama_gui2.zip"
Expand-Archive -LiteralPath "C:\ollama_gui2.zip" -DestinationPath "C:\ollama_gui2"
Set-Location "C:\ollama_gui2\ollama_gui2-main"

# Instalar las dependencias
python -m pip install -r requirements.txt

# Cambiar a la rama 'test'
git checkout test

# Ejecutar ollama.py
python ollama.py
