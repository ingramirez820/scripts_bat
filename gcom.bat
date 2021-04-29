@echo off
set /p msgcommit=^> Escriba el comentario:
git commit -m "%msgcommit"
