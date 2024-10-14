@echo off
setlocal DisableDelayedExpansion

:: Menú interactivo
:menu
cls
echo ___________________________________________________________________
echo          .:. Por. Ing. Frankliln Gutierrez Arizaca .:.
echo      ------------ fgutierrezarizaca@gmail.com ------------
echo ___________________________________________________________________
echo.
echo =========================================
echo   SCRIPT DE CONTROL OLLAMA
echo =========================================
echo 1. Verificar Python
echo 2. Verificar Git
echo 3. Clonar repositorio
echo 4. Cambiar a la rama 'test'
echo 5. Instalar dependencias
echo 6. Ejecutar ollama.py
echo 7. Salir
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
