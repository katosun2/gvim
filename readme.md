# 我的个人gvim配置

## X64下载
https://github.com/vim/vim-win32-installer/releases

## 安装/编译依懒
1. Vim >= 8.2 X64
2. python3 >= 3.8.0 X64
3. node >= 13.14 X64
4. npm >= 6.14.4
5. cmake >= 3.18.2 X64

## ycm编译问题
1. clone 项目https://github.com/ycm-core/YouCompleteMe
```
git clone https://github.com/ycm-core/YouCompleteMe
```
2. 安装 Visual Studio 2017+， 勾选 通用Windows平台开发(Desktop development with C++) 
3. 如果提示空目录，需要删除**YouCompleteMe\third_party\ycmd\third_party\tsserver**目录
4. 编译如下即可
```
python install.py --clang-completer --ts-completer  --msvc 15
```

## ycm安装或补充缺失的文件 
1. [必须]将 libclang.dll 复制一份到 ``YouCompleteMe/third_party/ycmd/third_party/clang/lib/``下面
2. 安装``tsserver``

## 安装vue语法分析服务 vetur
```
cd ./vimfiles/bundle/vetur
yarn 
yarn compile
```
