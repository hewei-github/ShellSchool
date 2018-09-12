@echo off

:: option 处理判断
echo %1|findstr /i "^-" >nul
if %errorlevel% equ 0  ( goto END) else ( goto FAID)

:: 不匹配输出1
:FAID
    echo 1
:END