@echo off 

echo Calculating total system memory
for /f "skip=1" %%p in ('wmic os get TotalVisibleMemorySize') do ( 
   set system_ram=%%p
   goto :end
)
:end


echo Total system ram is %system_ram%

set /a get_ridOf = 80/100

set /a "c=%system_ram% * 80 /100"

echo Will be getting rid of %c% bytes of memory

bcdedit.exe /set removememory %c% 

shutdown /r  