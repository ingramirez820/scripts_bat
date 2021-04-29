@echo off
set /p nproyecto= Ingrese nombre del proyecto:
composer create-project laravel/laravel="7.*" %nproyecto%
cd %nproyecto%
start cmd @cmd /c "code ."