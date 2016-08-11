@echo off
mkdir _build
cd _build
cmake .. -G "Visual Studio 14 2015 Win64"
cmake --build . --config "Release"