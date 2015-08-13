@echo on

set framework=v4.0.30319
set src=%~dp0..\src\

"%src%.nuget\nuget.exe" restore %src%

"%SystemDrive%\Windows\Microsoft.NET\Framework\%framework%\MSBuild.exe" "%src%GitVersion.sln"

copy "%~dp0NuGetCommandLineBuild\tools\GitVersion.exe" "%tmp%GitVersion.exe"

"%tmp%GitVersion.exe" /l console /output buildserver /updateAssemblyInfo /proj "%src%GitVersion.sln"
