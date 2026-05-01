using System.Diagnostics;
using System.Windows.Forms;
using RedEclipse.DevKit.Windows.Common;

ApplicationConfiguration.Initialize();
var form = new Form { Text = "Red Eclipse Ultimate Toolkit", Width = 500, Height = 360 };
var panel = new FlowLayoutPanel { Dock = DockStyle.Fill, FlowDirection = FlowDirection.TopDown, AutoScroll = true };

var actions = new Dictionary<string, string>
{
    ["Map Designer"] = "src/powershell/Tools/MapDesigner/Start-MapDesigner.ps1",
    ["Mutator Builder"] = "src/powershell/Tools/MutatorBuilder/Start-MutatorBuilder.ps1",
    ["Asset Pipeline"] = "src/powershell/Tools/AssetPipeline/Start-AssetPipeline.ps1",
    ["Server Orchestrator"] = "src/powershell/Tools/ServerOrchestrator/Start-ServerOrchestrator.ps1",
    ["Start Core"] = "src/powershell/Core/Start-DevKit.ps1"
};

foreach (var kv in actions)
{
    var b = new Button { Text = kv.Key, Width = 420, Height = 42 };
    b.Click += (_, _) => Process.Start(PowerShellRunner.Build(ToolkitPaths.Script(kv.Value)));
    panel.Controls.Add(b);
}
form.Controls.Add(panel);
Application.Run(form);
