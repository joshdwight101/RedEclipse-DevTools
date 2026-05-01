#!/usr/bin/env bash
set -euo pipefail

dotnet publish src/csharp/RedEclipse.DevKit.Cli/RedEclipse.DevKit.Cli.csproj -c Release -r linux-x64 --self-contained false -o dist/linux/devkit-cli
dotnet publish src/csharp/RedEclipse.DevKit.MenuDesigner/RedEclipse.DevKit.MenuDesigner.csproj -c Release -r linux-x64 --self-contained false -o dist/linux/menu-designer

dotnet publish src/csharp/RedEclipse.DevKit.Cli/RedEclipse.DevKit.Cli.csproj -c Release -r win-x64 --self-contained false -o dist/windows/devkit-cli
dotnet publish src/csharp/RedEclipse.DevKit.MenuDesigner/RedEclipse.DevKit.MenuDesigner.csproj -c Release -r win-x64 --self-contained false -o dist/windows/menu-designer
dotnet publish src/csharp/RedEclipse.DevKit.ContentStudio/RedEclipse.DevKit.ContentStudio.csproj -c Release -r win-x64 --self-contained false -o dist/windows/content-studio
dotnet publish src/csharp/RedEclipse.DevKit.ServerManager/RedEclipse.DevKit.ServerManager.csproj -c Release -r win-x64 --self-contained false -o dist/windows/server-manager
