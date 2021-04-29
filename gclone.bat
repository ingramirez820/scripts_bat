@echo off
rem set /p msgcommit=^> Escriba el comentario:
rem git commit -m "%msgcommit"
rem git push origin master
set /p repositorio=^> Pegue la ruta del respositorio para clonar:
git init
git clone %repositorio%
git remote add upstream %repositorio%
git remote -v
git pull upstream master