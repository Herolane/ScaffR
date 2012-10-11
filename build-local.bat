@echo off

:: Set repository info
set NUGET="nuget/nuget.exe"
set path=c:\development\localnuget

IF not exist %path% mkdir %path%

for /R %%i in (*.nuspec) do (

 SET NUSPEC=%%i
 echo %%i

 %NUGET% pack %%i -o %path%

)

pause