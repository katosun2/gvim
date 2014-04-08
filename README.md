我的 Gvim 配置 for Win
======================

安装方式
--------

- 下载 package.1.0.zip 放到根目录 也可以在 vimfiles/bin/package 建立对应的目录，下载对应的安装包

	* 下载点这里http://pan.baidu.com/s/1nt0n0At，

    * nodejs => nodejs_v1.0.zip

    * git => PortableGit-1.9.0-preview20140217.7z

    * MinGW => MinGW32_base_gcc_msys_toolkit.zip

    * python => python27.zip

    * ruby => ruby1.9.3p362.zip

    * phantomjs => phantomjs-1.9.7-windows.zip

    *注意*：这些安装包是处理过的绿色版，不是官方版，下载请点击这里：

- 环境依懒 git , python, nodejs 和 mingw 
- 解压 init.zip
- 运行 init.bat，安装需要的软件环境
- 运行 gvim 执行命令 :PluginInstall 安装插件
- 编译 You Complete Me ，教程看这里：https://github.com/Valloric/YouCompleteMe/wiki/Windows-Installation-Guide
- 进入 %USERFOLDER%\vimfiles\bundle\tern_for\ 运行 npm install 安装模块功能
- 全局安装 jshint，运行 npm install jshint -g
- 进入 %USERFOLDER%\vimfiles\bundle\vimproc.vim 运行 mingw32-make -f make_mingw32.mak
