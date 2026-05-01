using System.Diagnostics;
using System.Windows.Forms;
using RedEclipse.DevKit.Windows.Common;

ApplicationConfiguration.Initialize();
var form = new Form { Text = "Red Eclipse - Asset Pipeline", Width = 900, Height = 600 };
var run = new Button { Text = "Run Tool", Dock = DockStyle.Top, Height = 40 };
var box = new TextBox { Multiline = true, Dock = DockStyle.Fill, ScrollBars = ScrollBars.Both };
run.Click += (_, _) =>
{
    var psi = PowerShellRunner.Build(ToolkitPaths.Script("src/powershell/Tools/AssetPipeline/Start-AssetPipeline.ps1"));
    using var p = Process.Start(psi);
    if (p is null) return;
    box.Text = p.StandardOutput.ReadToEnd() + "\n" + p.StandardError.ReadToEnd();
};
form.Controls.Add(box);
form.Controls.Add(run);
Application.Run(form);
