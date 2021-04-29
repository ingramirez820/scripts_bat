@echo off
echo 1.-pc origin
echo 2.-lap upstream
set /p where_pull=^> Escriba desde donde hace el pull:
git pull %where_pull% master

