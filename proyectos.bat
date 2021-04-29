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
taskkill /F /IM steam.exe
taskkill /F /IM SystemSettings.exe
taskkill /F /IM YourPhone.exe
taskkill /F /IM TeamViewer_Service.exer
start chrome
timeout /t 10
start brave.exe
start htdocs.bat