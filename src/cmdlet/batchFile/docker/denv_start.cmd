@echo off

SET __DIR__=%~dp0
SET __INI_SCRIPT__=%__DIR__%init.sh
SET __VM__=default
SET __INIT__="sh -s"

if not [%1]==[] (
      set __VM__=%1
)

if [%2]==[--init] and not [%3]==[] (
      if exist %3 (
            set __INI_SCRIPT__=%3
      )
      if exist %__DIR__%%1 (
            
      )
)

:: start vm 
docker-machine start %__VM__% > nul
if [%errorlevel%]==[1] (
      echo start machine %__VM__% failed
      exit 1
)
:: docker-machine env set
docker-machine env >nul
if [%errorlevel%]==[1] (
   echo 1      
) else (
    if exist %__INI_SCRIPT__% (
      docker-machine ssh default "sh -s" < %__INI_SCRIPT__%
    ) else (
      docker-machine ssh default "sudo mkdir /data2 && sudo mount /dev/sda2 /data2;docker start redis && docker start mysql"
    )
)
:: GC_VAR
set __DIR__=
set __INI_SCRIPT__=
