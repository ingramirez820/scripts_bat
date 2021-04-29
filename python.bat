@echo off
Title Bienvenido %USERNAME% al creador de proyectos python
color 1F
:inicio
cls
echo *************************************
echo Lista de proyectos
echo ************************************
cd "C:\xampp\htdocs\pages\python"
dir /b /w
echo *************************************
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
goto salir
::Abrir proyecto
:optionabrirproyecto
cls
color fc
title Abriendo Proyecto
cd "C:\xampp\htdocs\pages\python"
dir /on /b /w
set /p abrirproyecto=^> Escriba el proyecto que desea abrir:
start cmd @cmd /k "code -r %abrirproyecto%&cd %abrirproyecto%"

start %windir%\explorer.exe "C:\xampp\htdocs\pages\python"
cls
goto inicio
::Crear proyecto
:optioncrearproyecto
cls
title Abriendo Proyecto
color f2
cls
cd "C:\xampp\htdocs\pages\python"
dir /on /b /w
set /p createfolder=^> Escriba el nombre de la carpeta para crear:
mkdir %createfolder%
echo %createfolder%
start cmd @cmd /k "code -r %createfolder%"
goto inicio
::pry
::Salir del programa
:salir
@cls&exit