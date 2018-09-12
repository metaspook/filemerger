:: Windows File Merger.
:: Version: 1.0
:: Written by Metaspook
:: License: <http://opensource.org/licenses/MIT>
:: Copyright (c) 2018 Metaspook.
:: 
@echo off

::
:: MAIN SCRIPT STARTS BELOW
::
title "Windows File Merger"
color 0B
mode con: cols=50 lines=24
pushd "%~dp0"

:FILEINPUT1
set FILEINPUTX=FILEINPUT1
call:BANNER
echo.
echo.
echo  ---------------------
echo   DRAG MAIN FILE HERE
echo  ---------------------
echo.
set /p file1=%1
if not defined file1 call:ERRORTAG
if not exist %file1% call:ERRORTAG
:FILEINPUT2
set FILEINPUTX=FILEINPUT2
call:BANNER
echo.
echo.
echo  --------------------
echo   DRAG 2ND FILE HERE
echo  --------------------
echo.
set /p file2=%2
if not defined file2 call:ERRORTAG
if not exist %file2% call:ERRORTAG
copy /b /y %file1%+%file2% C:\Users\DTCBL\Desktop\Merged.file
call:BANNER
echo.
echo.
echo  ------------------------------------
echo   NOTE: File merged as "Merged.file"
echo   rename the file and 
echo   extention as your need.
echo  ------------------------------------
echo.
echo Press any KEY to EXIT.
pause >nul
exit

:ERRORTAG
call:BANNER
echo.
echo  ------------------------------------
echo  [FAIL!] File doesn't exist
echo          or something went wrong.
echo  ------------------------------------
echo.
echo Press any KEY to Input again.
pause >nul
goto:%FILEINPUTX%


:BANNER
cls
echo.
echo     ________________________
echo         Windows File Merger \\      __
echo           \  Written by Metaspook  /  \
echo            \\______________________\__/
echo.
echo.
goto :EOF

rem nul 2>&1 timeout /t 3