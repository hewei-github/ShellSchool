@echo off

:: stop docker-machine vm

:stop_machine
set __VM__=default

if not [%1]==[] ( 
      docker-machine stop %__VM__%
) else (
      echo 1
)