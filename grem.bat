@echo off
rem set /p msgcommit=^> Escriba el comentario:
rem git commit -m "%msgcommit"
rem git push origin master
set /p rutaremota=^> Pegue la ruta remota:
git remote add origin %rutaremota%