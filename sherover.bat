@echo off
setlocal EnableDelayedExpansion

REM ------ change it to 1 if your files are seprated by folder for each season------
set /a ordered=1

REM ------ set the path to your files(example=> D:\series\black mirror) ------
REM ------ ATTENTION: don't put space between "=" and your address or variable 
set myDir=D:\series\friends

REM ------ set number of seasons ------
set /a numberOfSeasons=10


set /a season=%random% %%numberOfSeasons% +1
if %ordered%==1 (cd %myDir%\%season%) else (cd %myDir%) 


REM ------- grab all files' names --------
set n=0

REM ------ set the extensions you want by space(example=> *.mkv *.mp4 *.mpeg)
set ext=*.mkv *.mp4

for %%f in (%ext%) do (
   set /A n+=1
   set "file[!n!]=%%f"
)

set /A "rand=(n*%random%)/32768+1"

REM ------ execute file ------
if %ordered%==1 ("%myDir%\%season%\!file[%rand%]!") else ("%myDir%\!file[%rand%]!") 

endlocal
pause