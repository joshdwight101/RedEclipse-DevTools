# Windows Setup Guide

1. Run `installers/windows/install-devkit.ps1` as Administrator.
2. Launch toolkit shell with execution policy:
   `powershell -ExecutionPolicy RemoteSigned -File src/powershell/Core/Start-DevKit.ps1`
3. Start mini apps from `src/powershell/Tools/*`.
4. Launch C# GUI hub with `dotnet run --project src/csharp/RedEclipse.DevKit.Gui`.
