# GribApi.Native

## What it is
GribApi.Native is an interop shim for [GribApi.NET](https://github.com/0x1mason/GribApi.NET). It licensed under the friendly [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).

### Running SWIG
Most of the interop interfaces are generated using `SWIG` and included in the repository. You shouldn't need to create them. However, if you want to generate the interfaces yourself, you'll need `SWIG` installed and available on PATH. Then run `build/win32/swig_gen.cmd`. The `.cs` files are written to `build/SWIG`

### Building
You can build from Visual Studio or using the build script:
```
> build/win32/build_gribapi.cmd [rebuild|build] [tools version]
```
E.g., for VS 2015
```
> build/win32/build_gribapi.cmd rebuild 14
```
