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
:inicio
SET var=0
echo 1 Abrir Hr
echo 2 Abrir Proyectos
echo 3 Salir

SET /p var=^> Selecciona una Opcion [1-3]:
if "%var%"=="0" goto inicio
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto salir
::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. El numero "%var%" no es una opcion valida, por favor intente de nuevo.
goto: inicio
:op1
start %windir%\explorer.exe %userprofile%
goto :inicio
::Abrir proyectos
:op2
start %windir%\explorer.exe "C:\xampp\htdocs"
cls
cd "C:\xampp\htdocs"
dir /on /b /w
start cmd.exe /k cd "C:\xampp\htdocs"
goto :salir
:salir
@cls&exit