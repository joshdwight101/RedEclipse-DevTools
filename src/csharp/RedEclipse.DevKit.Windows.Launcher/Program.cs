using System.Diagnostics;
using System.Windows.Forms;
using RedEclipse.DevKit.Windows.Common;

ApplicationConfiguration.Initialize();
var form = new Form { Text = "Red Eclipse Ultimate Toolkit", Width = 620, Height = 500 };
var panel = new FlowLayoutPanel { Dock = DockStyle.Fill, FlowDirection = FlowDirection.TopDown, AutoScroll = true };

Button MakeButton(string text, Action action)
{
    var b = new Button { Text = text, Width = 560, Height = 42 };
    b.Click += (_, _) => action();
    return b;
}

void RunPowerShell(string script, string args = "") => Process.Start(PowerShellRunner.Build(ToolkitPaths.Script(script), args));

panel.Controls.Add(MakeButton("Launch Map Designer", () => RunPowerShell("src/powershell/Tools/MapDesigner/Start-MapDesigner.ps1", "-MapFile demo.mpz")));
panel.Controls.Add(MakeButton("Launch Mutator Builder", () => RunPowerShell("src/powershell/Tools/MutatorBuilder/Start-MutatorBuilder.ps1")));
panel.Controls.Add(MakeButton("Launch Asset Pipeline", () => RunPowerShell("src/powershell/Tools/AssetPipeline/Start-AssetPipeline.ps1")));
panel.Controls.Add(MakeButton("Launch Server Orchestrator", () => RunPowerShell("src/powershell/Tools/ServerOrchestrator/Start-ServerOrchestrator.ps1")));

panel.Controls.Add(MakeButton("Launch Asset Manager", () => RunPowerShell("src/powershell/Tools/AssetManager/Start-AssetManager.ps1")));
panel.Controls.Add(MakeButton("Launch Model Manager", () => RunPowerShell("src/powershell/Tools/ModelManager/Start-ModelManager.ps1")));
panel.Controls.Add(MakeButton("Launch Variable Preset Manager", () => RunPowerShell("src/powershell/Tools/VariablePresetManager/Start-VariablePresetManager.ps1")));
panel.Controls.Add(MakeButton("Launch Procedural World Builder", () => RunPowerShell("src/powershell/Tools/ProceduralWorldBuilder/Start-ProceduralWorldBuilder.ps1")));
panel.Controls.Add(MakeButton("Open Menu Designer App", () => Process.Start(new ProcessStartInfo{ FileName = "dotnet", Arguments = "run --project src/csharp/RedEclipse.DevKit.MenuDesigner", WorkingDirectory = ToolkitPaths.Script("."), UseShellExecute = true })));
panel.Controls.Add(MakeButton("Open Content Studio App", () => Process.Start(new ProcessStartInfo{ FileName = "dotnet", Arguments = "run --project src/csharp/RedEclipse.DevKit.ContentStudio", WorkingDirectory = ToolkitPaths.Script("."), UseShellExecute = true }))));
panel.Controls.Add(MakeButton("Open Windows Server Manager", () => Process.Start(new ProcessStartInfo{ FileName = "dotnet", Arguments = "run --project src/csharp/RedEclipse.DevKit.ServerManager", WorkingDirectory = ToolkitPaths.Script("."), UseShellExecute = true }))));
panel.Controls.Add(MakeButton("Start IPC Bridge", () => Process.Start(new ProcessStartInfo
{
    FileName = "cmd.exe",
    Arguments = "/c cd src\\ipc_bridge && npm start",
    WorkingDirectory = ToolkitPaths.Script("."),
    UseShellExecute = true
})));
panel.Controls.Add(MakeButton("Open Web Dashboard", () => Process.Start(new ProcessStartInfo
{
    FileName = "powershell.exe",
    Arguments = "-ExecutionPolicy RemoteSigned -File src/launcher/launch-kiosk.ps1",
    WorkingDirectory = ToolkitPaths.Script("."),
    UseShellExecute = true
})));
panel.Controls.Add(MakeButton("Start Docker Server", () => Process.Start(new ProcessStartInfo
{
    FileName = "cmd.exe",
    Arguments = "/c docker compose -f docker\\docker-compose.yml up --build",
    WorkingDirectory = ToolkitPaths.Script("."),
    UseShellExecute = true
})));

form.Controls.Add(panel);
Application.Run(form);
