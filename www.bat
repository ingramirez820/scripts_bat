@echo off
REM https://docs.microsoft.com/es-es/windows/deployment/usmt/usmt-recognized-environment-variables
REM https://elamigoinformaticoblog.wordpress.com/2018/10/19/como-migrar-la-configuracion-de-google-chrome-a-otro-pc/
REM https://norfipc.com/registro/modificar-informacion-propiedades-sistema.html
REM .bat con permisos de administrador
:-------------------------------------
REM  --> Analizando los permisos
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> Si hay error es que no hay permisos de administrador.
if '%errorlevel%' NEQ '0' (
    echo Solicitando permisos de administrador... Requesting administrative privileges... Anfordern Administratorrechte ...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------  

REM   INCLUYE AQUÍ TU CÓDIGO DEL FICHERO .bat PARA PARAR EL PROCESO DEL ANTIVIRUS
Title Bienvenido %USERNAME% al creador de proyectos
color 1F
:inicio
cls
color 1F
SET sel_option=0
echo 1 Abrir Proyecto
echo 2 Crear Proyecto
echo 3 Salir
::Aqui seleccionamos la opcion de abrir o crear
SET /p sel_option=^> Selecciones una Opción [1-3]:
if "%sel_option%"=="0" goto inicio
if "%sel_option%"=="1" goto optionabrirproyecto
if "%sel_option%"=="2" goto optioncrearproyecto
if "%sel_option%"=="3" goto salir
::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. El numero "%sel_option%" no es una opcion valida, por favor intente de nuevo.
goto inicio
::Abrir proyecto
:optionabrirproyecto
cls
color fc
title Abriendo Proyecto
cd "C:\xampp\htdocs"
dir /on /b /w
set /p abrirproyecto=^> Escriba el proyecto que desea abrir:
start cmd @cmd /c "code -r %abrirproyecto%"
http-server
start %windir%\explorer.exe "C:\xampp\htdocs"
cls
goto inicio
::Crear proyecto
:optioncrearproyecto
cls
title Abriendo Proyecto
color f2
cd "C:\xampp\htdocs"
dir /on /b /w
echo 1 Crear Folder
echo 2 Crear folder en el folder
echo 3 Regresar al menu inicio
set /p retornar=^> Que desea hacer?:
if "%retornar%"=="1" goto crearfolder
if "%retornar%"=="2" goto crearfolderenfolder
if "%retornar%"=="3" goto inicio
echo. El numero "%retornar%" no es una opcion valida, por favor intente de nuevo.
goto inicio
:crearfolder
cls
cd "C:\xampp\htdocs"
dir /on /b /w
set /p createfolder=^> Escriba el nombre de la carpeta para crear:
mkdir %createfolder%
echo %createfolder%
start cmd @cmd /c "code -r %createfolder%"
http-server
start cmd /k %createfolder%
goto inicio
:crearfolderenfolder
cd %retornar%
set /p createfolderinfolder=^> Escriba el nombre de la carpeta para crear:
mkdir %createfolderinfolder%
start %windir%\explorer.exe %createfolderinfolder%
echo %createfolderinfolder%
start cmd @cmd /c "code -r %createfolderinfolder%"
http-server
start cmd /k %createfolderinfolder%
goto inicio
::pry
::Salir del programa
:salir
@cls&exit