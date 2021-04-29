@echo off+
gadd.bat
gcom.bat
echo 1.-pc origin
echo 2.-lap upstream
set /p where_push=^> Escriba desde donde hace el push:
git pull %where_push% master

