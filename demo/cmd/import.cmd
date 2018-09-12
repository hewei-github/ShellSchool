@echo off 
set __DIR__=%~dp0
 
:: batchfile 引用其他文件如何处理 

:: 第一种调用 当前窗口 当前脚本 执行
call %__DIR__%options.cmd %1

:: 第二种调用 当前窗口 当前脚本 执行
cd %__DIR__% && options.cmd %1

:: 第三种调用 新开一次窗口 执行
start "new cmd" cmd /k %__DIR__%options.cmd %1

:: 第四种 大胆执行 [可能会有异常]
%__DIR__%options.cmd %1

:: 第五种 执行结果重定向 通过 errorlevel 判断结果
%__DIR__%options.cmd %1 >nul 

:: 第六种 执行并判断结果 linux 中 `cmd paras` 或者 $(cmd paras)
for /F %%i in ('%__DIR__%options.cmd %1') do (set tmp=%%i)
