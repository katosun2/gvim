# 我的个人gvim配置

## X64下载
https://github.com/vim/vim-win32-installer/releases

## 安装依懒
1. Vim >= 8.2 X64
2. python3 >= 3.8.0 X64
3. 


## ycm编译问题
https://stackoverflow.com/questions/51668676/cmake-visual-studio-15-2017-could-not-find-any-instance-of-visual-studio
```
1. Open Visual Studio
2. Go to Tools -> Get Tools and Features
3. In the "Workloads" tab enable "Desktop development with C++"
4. Click Modify at the bottom right

These steps resulted in the "Visual C++ tools for CMake" feature being installed, but the other optional C++ features included in this workload may also helpful for what you are trying to do.

After the Visual Studio updater finishes installing try re-running the command. You may need to open a new command window.
```
