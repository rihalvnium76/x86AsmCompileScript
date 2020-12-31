@echo off&setlocal ENABLEDELAYEDEXPANSION
::---CONFIG---
set "NASM_DIR=C:\Program Files\NASM"
set "DD_DIR=D:\a"
set "BOCHSDBG_DIR=C:\Program Files\Bochs-2.6.11"
set "BOCHSDBG_CONFIG_FILE=D:\a\bochsrc.bxrc"
set "DISK_FILE=D:\a\LEECHUNG.vhd"
::---CONFIG---
if not "%BOCHSDBG_CONFIG_FILE%"=="" (set "BOCHSDBG_ARGS=-f "%BOCHSDBG_CONFIG_FILE%"") else set "BOCHSDBG_ARGS="
set path=%NASM_DIR%;%DD_DIR%;%BOCHSDBG_DIR%;%path%

set "mode=%~1"
set "file=%~2"
if "%~3"=="" (set seek=0) else set "seek=%~3"
set failed=0
set pos=0
if "%mode%"=="" exit /b
:parse
if not "!mode:~%pos%,1!"=="" (
	call :arg1 !mode:~%pos%,1!
	set /a pos+=1
	if !failed!==0 goto parse
)
exit /b

:arg1
set "chr=%1"
if /i "%chr%"=="c" if not "%file%"=="" nasm -f bin "%file%.asm" || set failed=1
if /i "%chr%"=="w" if not "%file%"=="" (
	if not "%file%"=="" dd if="%file%" of="%DISK_FILE%" bs=512 seek=%seek% conv=notrunc || set failed=1
)
if /i "%chr%"=="r" start bochsdbg %BOCHSDBG_ARGS%
goto :eof
