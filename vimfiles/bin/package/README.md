绿化脚本
========

使用前说明
----------

    * 本脚本程序，仅适用于 https://github.com/katosun2/gvim.git 

可能遇到问题
------------

    1、使用make编译时出现

    error: 'off64_t' does not name a type __CRT_INLINE off64_t lseek64 (int, off64_t, int);

    查找{MinGW dir}/include/io.h 

    __CRT_INLINE off64_t lseek64 (int, off64_t, int);
    __CRT_INLINE off64_t lseek64 (int fd, off64_t offset, int whence) {

    替换

    __CRT_INLINE _off64_t lseek64 (int, _off64_t, int);
    __CRT_INLINE _off64_t lseek64 (int fd, _off64_t offset, int whence) {


