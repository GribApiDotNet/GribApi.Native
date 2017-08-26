@ECHO OFF

REM Sample usages:
REM
REM  Build and create nuget pkg
REM  - build_gribapi.cmd [rebuild] [tools version] [package version]
REM 


SET PKG_VERSION=%3
SET ERRORLEVEL=0

call %~dp0build_gribapi_config_type.cmd %1 %2 Debug
if ERRORLEVEL 1 (
	@ECHO ON
	ECHO BUILD FAILED
	EXIT /B 1
)

call %~dp0build_gribapi_config_type.cmd %1 %2 Release
if ERRORLEVEL 1 (
	@ECHO ON
	ECHO BUILD FAILED
	EXIT /B 1
)

if NOT "%PKG_VERSION%"=="" (
	@ECHO ON
	call %~dp0build_nuget.cmd %PKG_VERSION%
	if ERRORLEVEL 1 (
		ECHO PACKAGE FAILED
		EXIT /B 1
	)
)