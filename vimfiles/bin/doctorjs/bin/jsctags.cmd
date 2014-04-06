@echo off
REM Windows batch file to run jsctags
REM
setlocal
set jsctags=%~dp0
set NODE_PATH=%jsctags%..\lib\jsctags;%NODE_PATH%
node "%jsctags%jsctags.js" %*
endlocal
