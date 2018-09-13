@echo off


set __INSTALL_DIR__=%2
set __INSTALL__=%1

:: 使用 windows 包管理工具 choco 安装

:: MSI package install
choco install %__INSTALL__%  -ia "INSTALLDIR=""%__INSTALL_DIR__%""" 

:: NSIS package install
choco install %__INSTALL__%  -ia "'/D=%__INSTALL_DIR__%'"

:: setup default vm
docker-machine create --driver virtualbox \
               --virtualbox-share-folder \
               "E:\workpaces\php\h5sdk:/data/h5sdk"  \
               -engine-registry-mirror https://1rqn7spi.mirror.aliyuncs.com default