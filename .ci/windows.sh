#!/bin/sh -ex

cmake --fresh -S . -B build -G "Visual Studio 17 2022" -A x64 -T v141 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCITRA_USE_BUNDLED_QT=1 \
    -DCITRA_USE_BUNDLED_SDL2=1 \
    -DCMAKE_USE_OPENSSL=0

"C:/BuildTools/MSBuild/Current/Bin/MSBuild.exe" build/citra.sln \
  -property:Configuration=Release,Platform=x64 \
  -maxCpuCount \
  -target:Rebuild

dir build/bin/Release