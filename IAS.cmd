@echo off
setlocal EnableDelayedExpansion

:: Definir colores
set "color_title=0A"
set "color_option=0B"
set "color_input=0F"

:: Limpiar pantalla
cls

:: Menú interactivo
:menu
cls
echo =========================================
echo. 
echo. 
echo. 
echo     %color_title%Script de Control de Ollama%color_title%
echo. 
echo =========================================
echo. 
echo    Creado por: Franklin Gutierrez
echo    Contacto: franklin@correo.com
echo. 
echo. 
echo =========================================
echo    %color_option%1.%color_input% Verificar Python
echo    %color_option%2.%color_input% Verificar Git
echo    %color_option%3.%color_input% Clonar repositorio
echo    %color_option%4.%color_input% Cambiar a la rama 'test'
echo    %color_option%5.%color_input% Instalar dependencias
echo    %color_option%6.%color_input% Ejecutar ollama.py
echo    %color_option%7.%color_input% Salir
echo =========================================
set /p choice="Elige una opción (1-7): "

if "%choice%"=="1" goto check_python
if "%choice%"=="2" goto check_git
if "%choice%"=="3" goto clone_repo
if "%choice%"=="4" goto checkout_test
if "%choice%"=="5" goto install_dependencies
if "%choice%"=="6" goto run_ollama
if "%choice%"=="7" goto end

:check_python
echo Verificando si Python está instalado...
python --version 2>nul
if %errorlevel% neq 0 (
    echo Python no está instalado. Por favor, instala Python antes de continuar.
    pause
) else (
    echo Python está instalado.
    python --version
    pause
)
goto menu

:check_git
echo Verificando si Git está instalado...
git --version 2>nul
if %errorlevel% neq 0 (
    echo Git no está instalado. Por favor, instala Git antes de continuar.
    pause
) else (
    echo Git está instalado.
    git --version
    pause
)
goto menu

:clone_repo
echo Clonando el repositorio...
cd C:\
git clone --branch test https://github.com/franklingutierrez/ollama_gui2.git
pause
goto menu

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
