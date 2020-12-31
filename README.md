A simple Windows script for one-click compilation, writing, and running x86 assembly.  
This self-used script is suitable for the book ***x86 Assembly Language: From Real Mode to Protected Mode (by Lee Chung)***  and related courses.
# Requirement
NASM  
Bochs  
[DD for windows](http://www.chrysocome.net/dd)
# Usage
1. Set the value of path variable in script header to relative path and save the script  
2. Copy the script to source directory  
3. Open CMD in this directory  
4. Execute the script
# Arguments
`dep.bat <Mode> <FileNameWithoutExtensions> [DD_Seek]`
## Mode
Free combination of the following tags is supported.  

* c : Compile source  
* w : Write binary files to virtual disk  
* r : Launch Bochsdbg to execute the code
## DD_Seek
The number of blocks skipped at the beginning of the write file, the default unit of the block is 512 bytes.
# Example
Compile, write, and run x86 MBR program source code a.asm, in which the binary code is written to sector 101.
```
dep cwr a 100
```
