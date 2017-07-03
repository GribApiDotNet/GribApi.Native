:: build_nuget.cmd [x.x.x] [Release|Debug]

SET _VERSION=%1
SET _CONFIG=%2
if "%1"=="" SET _VERSION=0.0.0-beta
if "%2"=="" SET _CONFIG=Release

RD %~dp0..\..\nuget.package\content /S /Q

xcopy %~dp0..\..\bin\%_CONFIG%\Grib.Api\lib\win\x64\Grib.Api.Native.dll %~dp0..\..\nuget.package\content\net45\Grib.Api\lib\win\x64\ /S /Y /I /Q
xcopy %~dp0..\..\bin\%_CONFIG%\Grib.Api\lib\win\x64\Grib.Api.Native.pdb %~dp0..\..\nuget.package\content\net45\Grib.Api\lib\win\x64\ /S /Y /I /Q

xcopy %~dp0..\..\bin\%_CONFIG%\Grib.Api\lib\win\x86\Grib.Api.Native.dll %~dp0..\..\nuget.package\content\net45\Grib.Api\lib\win\x86\ /S /Y /I /Q
xcopy %~dp0..\..\bin\%_CONFIG%\Grib.Api\lib\win\x86\Grib.Api.Native.pdb %~dp0..\..\nuget.package\content\net45\Grib.Api\lib\win\x86\ /S /Y /I /Q

xcopy %~dp0..\..\GribApi.XP\grib_api\definitions %~dp0..\..\nuget.package\content\net45\Grib.Api\definitions\ /S /d /I /Q /Y
xcopy %~dp0..\..\GribApi.XP\grib_api\samples %~dp0..\..\nuget.package\content\net45\Grib.Api\samples\ /S /d /I /Q /Y
xcopy %~dp0..\..\GribApi.XP\grib_api\ifs_samples %~dp0..\..\nuget.package\content\net45\Grib.Api\ifs_samples\ /S /d /I /Q /Y

pushd %~dp0..\..\nuget.package
nuget pack Grib.Api.Native.nuspec -Version %_VERSION%
popd