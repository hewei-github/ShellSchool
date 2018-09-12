@echo off

SET __DIR__=%~dp0
SET __INI_SCRIPT__=%__DIR__%init.sh
SET __VM__=default
 
:: start vm
docker-machine start %__VM__%
:: start set env [path]
:: docker-machine env

docker-machine env >nul
IF [%errorlevel%]==[1] (
   echo 1      
) ELSE (
   docker-machine ssh default "sudo mkdir /data2 && sudo mount /dev/sda2 /data2;docker start redis && docker start mysql"
)
:: start vm config
:: docker-machine ssh default "sh -s" < %__INI_SCRIPT__%
SET __DIR__=
SET __INI_SCRIPT__=
