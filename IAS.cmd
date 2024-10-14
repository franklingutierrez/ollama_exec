@echo off
setlocal DisableDelayedExpansion

:: Menú interactivo
:menu
cls
echo =========================================
echo  Script de Control de Ollama
echo =========================================
echo 1. Cambiar a la rama 'test'
echo 2. Instalar dependencias
echo 3. Ejecutar ollama.py
echo 4. Salir
echo =========================================
set /p choice="Elige una opción (1-4): "

if "%choice%"=="1" goto checkout_test
if "%choice%"=="2" goto install_dependencies
if "%choice%"=="3" goto run_ollama
if "%choice%"=="4" goto end

:checkout_test
echo Cambiando a la rama 'test'...
cd C:\ollama_gui2
git checkout test
pause
goto menu

:install_dependencies
echo Instalando dependencias...
cd C:\ollama_gui2
python -m pip install -r requirements.txt
pause
goto menu

:run_ollama
echo Ejecutando ollama.py...
cd C:\ollama_gui2
python ollama.py
pause
goto menu

:end
pause
