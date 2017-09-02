:: build_nuget.cmd [x.x.x]

SET _VERSION=%1
if "%1"=="" SET _VERSION=0.0.0-beta

RD %~dp0..\..\nuget.package\content /S /Q

xcopy %~dp0..\..\bin\Release\Grib.Api\lib\win\x64\Grib.Api.Native.dll %~dp0..\..\nuget.package\content\net45\Grib.Api\lib\win\x64\Release /S /Y /I /Q
xcopy %~dp0..\..\bin\Release\Grib.Api\lib\win\x64\Grib.Api.Native.pdb %~dp0..\..\nuget.package\content\net45\Grib.Api\lib\win\x64\Release /S /Y /I /Q
xcopy %~dp0..\..\bin\Debug\Grib.Api\lib\win\x64\Grib.Api.Native.dll %~dp0..\..\nuget.package\content\net45\Grib.Api\lib\win\x64\Debug /S /Y /I /Q
xcopy %~dp0..\..\bin\Debug\Grib.Api\lib\win\x64\Grib.Api.Native.pdb %~dp0..\..\nuget.package\content\net45\Grib.Api\lib\win\x64\Debug /S /Y /I /Q

xcopy %~dp0..\..\bin\Release\Grib.Api\lib\win\x86\Grib.Api.Native.dll %~dp0..\..\nuget.package\content\net45\Grib.Api\lib\win\x86\Release /S /Y /I /Q
xcopy %~dp0..\..\bin\Release\Grib.Api\lib\win\x86\Grib.Api.Native.pdb %~dp0..\..\nuget.package\content\net45\Grib.Api\lib\win\x86\Release /S /Y /I /Q
xcopy %~dp0..\..\bin\Debug\Grib.Api\lib\win\x86\Grib.Api.Native.dll %~dp0..\..\nuget.package\content\net45\Grib.Api\lib\win\x86\Debug /S /Y /I /Q
xcopy %~dp0..\..\bin\Debug\Grib.Api\lib\win\x86\Grib.Api.Native.pdb %~dp0..\..\nuget.package\content\net45\Grib.Api\lib\win\x86\Debug /S /Y /I /Q

xcopy %~dp0..\..\GribApi.XP\grib_api\definitions %~dp0..\..\nuget.package\content\net45\Grib.Api\definitions\ /S /d /I /Q /Y
xcopy %~dp0..\..\GribApi.XP\grib_api\samples %~dp0..\..\nuget.package\content\net45\Grib.Api\samples\ /S /d /I /Q /Y
xcopy %~dp0..\..\GribApi.XP\grib_api\ifs_samples %~dp0..\..\nuget.package\content\net45\Grib.Api\ifs_samples\ /S /d /I /Q /Y

pushd %~dp0..\..\nuget.package
nuget pack Grib.Api.Native.nuspec -Version %_VERSION%
popd