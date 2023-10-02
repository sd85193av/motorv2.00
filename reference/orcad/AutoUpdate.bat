@echo off
mode con cols=80 lines=25

set src=https://github.com/ZxyKira/A0099-S002-ORCAD-LIBRARY
set /a numberOfFile=0
 
echo ********************************************************************************
echo *                    Orcad schematic library update tool                       *
echo *                                                                              *
echo *                                                               Made by Danny  *
echo ********************************************************************************
echo.
echo Download list from: %src%
set target="%src%/raw/master/list"
call bitsadmin /transfer PcblibUpdateJob /download /priority FOREGROUND %%target%% %~dp0\list > nul
echo Update finish!
echo.
for /f %%a in (list) do (
	set /a numberOfFile=numberOfFile+1
)

echo Found %numberOfFile% file need download
echo.
for /f "tokens=1,2" %%a in (list) do (
	set target="%src%/raw/master/%%a"
	call echo|set /p="downloading %%b ...	"
	call bitsadmin /transfer PcblibUpdateJob /download /priority FOREGROUND %%target%% %~dp0\%%b > nul
    echo Finish!
)
echo.
del "%~dp0list"
echo Update finish! Press any key to exit.
pause > nul