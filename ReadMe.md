# C/C++ quick start

The simplest C/C++ project template for beginners.

## Install minimal All-in-One Development Environment

### Windows

```powershell
winget install BrechtSanders.WinLibs.POSIX.MSVCRT Xmake-io.Xmake Microsoft.VisualStudioCode
# If you have building errors with XMake & MinGW, the command below might help you to fix it,
# and "somehash" in the following path is a placeholder for the actual hash of the installed package
xmake f -p mingw --mingw=%LOCALAPPDATA%\Microsoft\WinGet\Packages\BrechtSanders.WinLibs.POSIX.MSVCRT_Microsoft.Winget.Source_somehash\mingw64 -c
code --install-extension tboox.xmake-vscode
code --install-extension ms-vscode.cpptools-extension-pack
```

### MacOS

```bash
brew install gcc xmake
brew install --cask visual-studio-code
code --install-extension tboox.xmake-vscode
code --install-extension ms-vscode.cpptools-extension-pack
```

### Linux

```bash
curl -fsSL https://xmake.io/shget.text | bash
flatpak install com.visualstudio.code
code --install-extension tboox.xmake-vscode
code --install-extension ms-vscode.cpptools-extension-pack
```

## XMake FAQ

> If you want to known more usage about xmake, please see https://xmake.io

You can enter the project directory firstly before building project.

```bash
cd projectdir
```

1. How to build project?

```bash
xmake
```

2. How to configure project?

```bash
xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
```

3. Where is the build output directory?

The default output directory is `./build` and you can configure the output directory.

```bash
xmake f -o outputdir
xmake
```

4. How to run and debug target after building project?

```bash
xmake run [targetname]
xmake run -d [targetname]
```

5. How to install target to the system directory or other output directory?

```bash
xmake install
xmake install -o installdir
```

6. Add some frequently-used compilation flags in `xmake.lua`

```lua
@code
   -- add debug and release modes
   add_rules("mode.debug", "mode.release")

   -- add macro definition
   add_defines("NDEBUG", "_GNU_SOURCE=1")

   -- set warning all as error
   set_warnings("all", "error")

   -- set language: c99, c++11
   set_languages("c99", "c++11")

   -- set optimization: none, faster, fastest, smallest
   set_optimize("fastest")

   -- add include search directories
   add_includedirs("/usr/include", "/usr/local/include")

   -- add link libraries and search directories
   add_links("tbox")
   add_linkdirs("/usr/local/lib", "/usr/lib")

   -- add system link libraries
   add_syslinks("z", "pthread")

   -- add compilation and link flags
   add_cxflags("-stdnolib", "-fno-strict-aliasing")
   add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
@endcode
```
