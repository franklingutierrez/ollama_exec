@echo off
setlocal EnableDelayedExpansion

:: Configuración de colores
set "cyan=[96m"
set "green=[92m"
set "yellow=[93m"
set "reset=[0m"

:: Información del creador
set "creator=Franklin Gutierrez"
set "email=franklin.gutierrez@example.com"

:: Menú interactivo
:menu
cls
echo =========================================
echo  %cyan%Script de Control de Ollama%reset%
echo =========================================
echo Creado por: %green%%creator%%reset%
echo Email: %green%%email%%reset%
echo =========================================
echo %yellow%1. Verificar Python%reset%
echo %yellow%2. Verificar Git%reset%
echo %yellow%3. Clonar repositorio%reset%
echo %yellow%4. Cambiar a la rama 'test'%reset%
echo %yellow%5. Instalar dependencias%reset%
echo %yellow%6. Ejecutar ollama.py%reset%
echo %yellow%7. Salir%reset%
echo =========================================
set /p "choice=%green%Franklin%reset%, elige una opción (1-7): "
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
    echo %cyan%Python no está instalado. Por favor, instala Python antes de continuar.%reset%
    pause
) else (
    echo %cyan%Python está instalado.%reset%
    python --version
    pause
)
goto menu

:check_git
echo Verificando si Git está instalado...
git --version 2>nul
if %errorlevel% neq 0 (
    echo %cyan%Git no está instalado. Por favor, instala Git antes de continuar.%reset%
    pause
) else (
    echo %cyan%Git está instalado.%reset%
    git --version
    pause
)
goto menu

:clone_repo
echo %cyan%Clonando el repositorio...%reset%
cd C:\
git clone --branch test https://github.com/franklingutierrez/ollama_gui2.git
pause
goto menu

:checkout_test
echo %cyan%Cambiando a la rama 'test'...%reset%
cd C:\ollama_gui2
git checkout test
pause
goto menu

:install_dependencies
echo %cyan%Instalando dependencias...%reset%
cd C:\ollama_gui2
python -m pip install -r requirements.txt
pause
goto menu

:run_ollama
echo %cyan%Ejecutando ollama.py...%reset%
cd C:\ollama_gui2
python ollama.py
pause
goto menu

:end
echo %green%¡Gracias por usar el Script de Control de Ollama, Franklin!%reset%
pause