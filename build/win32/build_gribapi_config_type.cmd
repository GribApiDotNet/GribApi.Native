@ECHO OFF

REM Sample usages:
REM
REM  Building and running tests
REM  - build_gribapi.cmd [rebuild] [tools version] [Debug|Release] [package version]
REM 

SET REBUILD=/t:Build 
if "%1"=="rebuild" SET REBUILD=/t:Clean,Build 

SET VisualStudioVersion=%2
if "%2"=="" (
	SET VisualStudioVersion=14
)

SET CONFIG=%3
if "%3"=="" (
	SET CONFIG=Release
)

SET PKG_VERSION=%4

SET ERRORLEVEL=0

::SETLOCAL

SET TV=/property:PlatformToolset=V%VisualStudioVersion%0

SET PATH=C:\Program Files (x86)\NUnit 2.6.4\bin;%PATH%
::SET PATH=C:\Program Files (x86)\NUnit 2.6.4\bin;C:\Program Files (x86)\Microsoft Visual Studio %VisualStudioVersion%.0\VC\bin;%PATH%
SET BASEDIR=%~dp0..\..\
SET FrameworkVersion=v4.0.30319
SET FrameworkDir="%SystemRoot%\Microsoft.NET\Framework"
SET CRT="C:\Program Files\MSBuild\Microsoft.Cpp\v4.0\V%VisualStudioVersion%0/"

if exist "C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V%VisualStudioVersion%0" (
  SET CRT="C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V%VisualStudioVersion%0/"
)

if exist "%SystemRoot%\Microsoft.NET\Framework64" (
  SET FrameworkDir="%SystemRoot%\Microsoft.NET\Framework64"
)

::Setlocal EnableDelayedExpansion

@ECHO ON

:::::::::: X64

CALL "%BASEDIR%GribApi.XP\build\win32\build_gribapi.cmd" %1 %2 %3

SET BASEDIR=%~dp0..\..\

"%FrameworkDir%\%FrameworkVersion%\msbuild.exe" "%BASEDIR%src\Grib.Api.Native.vcxproj"  /property:Configuration="%CONFIG%" /property:Platform="x64" %TV% /property:VCTargetsPath=%CRT% %REBUILD%

@ECHO OFF
if ERRORLEVEL 1 (
	@ECHO ON
	ECHO BUILD FAILED
	EXIT /B 1
)

:::::::::: X86

@ECHO ON
"%FrameworkDir%\%FrameworkVersion%\msbuild.exe" "%BASEDIR%src\Grib.Api.Native.vcxproj"  /property:Configuration="%CONFIG%" /property:Platform="Win32" %TV% /property:VCTargetsPath=%CRT% %REBUILD%

@ECHO OFF
if ERRORLEVEL 1 (
	@ECHO ON
	ECHO BUILD FAILED
	EXIT /B 1
)