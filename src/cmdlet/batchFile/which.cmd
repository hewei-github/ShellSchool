@echo off
:: hack for linux which on windows

:: initialization var 
:INI 
set  __DIR__=%~dp0
set  __FILE__=%0
set  __FUNC__=which
set __ARGC__=0

:ARGS_LOOP
if [%1]==[] ( goto ARGS_OPT)
:: 保存参数 set /a 数值运算赋值
set /a __ARGC__=%__ARGC__%+1
if [%__ARGC__%]==[] ( set __ARGS__=%1) else ( set __ARGS__=%__ARGS__% %1)
set tmp=P%__ARGC__%
set  %tmp%=%1
:: todo other 
shift
goto ARGS_LOOP

:: 参数选择
:ARGS_OPT
if "%P1%"=="" ( set __FUNCTION__=%__FUNC__%) else ( set __FUNCTION__=%P1%) 
:: __CALL__START__ 调用判断
if "%__FUNCTION__%"=="which" goto which 
if "%__FUNCTION__%"=="find" goto find  
if "%__FUNCTION__%"=="help" goto help  
if not "%__FUNCTION__%"=="" goto help  
goto GC_VAR
:: __CALL__END__ 

:: 返回对应文件所在位置
:which

for /F %%i in ('%__DIR__%options.cmd %P2%') do (set tmp=%%i)

echo %tmp%

goto GC_VAR

:: 查找文件所在 , 文件内容
:find


goto GC_VAR

:: 帮助菜单
:help

echo        ####################
echo        ##  which : find  ## 
echo        ####################
echo        eg : --cmd find  --dir C:\  --file file
echo        eg : --cmd find  --dir C:\  --regex file
echo        eg : find  file
echo        eg : --cmd which --file ping --include D:\installs
echo        eg : -c which -f ping -i D:\installs 
echo        eg : which ping

:: 回收变量
:GC_VAR

:: 回收初始化参数 
set __DIR__=
set __FILE__=
set __FUNC__=
set __FUNCTION__=


:: 回收解构参数
:ARGS_GC_LOOP
if %__ARGC__% leq 0 ( goto ARGS_GC_END)
set tmp=P%__ARGC__%
set %tmp%=
set /a __ARGC__=%__ARGC__%-1
goto ARGS_GC_LOOP
:ARGS_GC_END

set __ARGC__=
set __ARGS__=
set  tmp=

:: neq - !=
:: equ - ==
:: lss - <
:: leq - <=
:: gtr - >
:: geq - >=

