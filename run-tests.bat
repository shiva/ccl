@echo off
if exist .\_build\bin\Release\dotest.exe (
	.\_build\bin\Release\dotest.exe
)

if exist .\_build\bin\Debug\dotest.exe (
	.\_build\bin\Debug\dotest.exe
)
