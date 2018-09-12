@echo off
REM test bat script

REM 注释
:: 中文注释
REM 中文注释 echo "dir :" %~dp0 中文注释

SET __DIR__=%~dp0

echo %__DIR__%

IF NOT  "%1"=="" ( 
      echo %1 
) ELSE ( 
      echo %0 
)


@echo on