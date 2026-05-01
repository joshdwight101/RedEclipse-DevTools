using System.Diagnostics;
using System.Windows.Forms;

ApplicationConfiguration.Initialize();
var f=new Form{Text="Red Eclipse Content Studio",Width=980,Height=640,KeyPreview=true};
var tabs=new TabControl{Dock=DockStyle.Fill};

TabPage MakeTab(string title,string action){
  var tab=new TabPage(title); var src=new TextBox{Dock=DockStyle.Top,PlaceholderText="Source path"}; var name=new TextBox{Dock=DockStyle.Top,PlaceholderText="Bundle name"}; var run=new Button{Text="Run",Dock=DockStyle.Top}; var outBox=new TextBox{Dock=DockStyle.Fill,Multiline=true};
  run.Click+=(_,_)=>{var p=Process.Start(new ProcessStartInfo("pwsh",$"-File src/powershell/Tools/ContentPipeline/Start-ContentPipeline.ps1 -Action {action} -SourcePath \"{src.Text}\" -Name \"{name.Text}\""){RedirectStandardOutput=true,UseShellExecute=false}); if(p!=null){outBox.Text=p.StandardOutput.ReadToEnd(); p.WaitForExit();}};
  tab.Controls.Add(outBox); tab.Controls.Add(run); tab.Controls.Add(name); tab.Controls.Add(src); return tab;
}

tabs.TabPages.Add(MakeTab("Textures (Ctrl+1)","import-texture"));
tabs.TabPages.Add(MakeTab("Models (Ctrl+2)","import-model"));
tabs.TabPages.Add(MakeTab("Entities (Ctrl+3)","import-entity-pack"));
var publish=new TabPage("Publish Kit (Ctrl+4)"); var b=new Button{Text="Publish Map Kit",Dock=DockStyle.Top}; var o=new TextBox{Multiline=true,Dock=DockStyle.Fill}; b.Click+=(_,_)=>{var p=Process.Start(new ProcessStartInfo("pwsh","-File src/powershell/Tools/ContentPipeline/Start-ContentPipeline.ps1 -Action publish-map-kit"){RedirectStandardOutput=true,UseShellExecute=false}); if(p!=null){o.Text=p.StandardOutput.ReadToEnd(); p.WaitForExit();}}; publish.Controls.Add(o); publish.Controls.Add(b); tabs.TabPages.Add(publish);

f.KeyDown+=(_,e)=>{if(e.Control&&e.KeyCode==Keys.D1)tabs.SelectedIndex=0; if(e.Control&&e.KeyCode==Keys.D2)tabs.SelectedIndex=1; if(e.Control&&e.KeyCode==Keys.D3)tabs.SelectedIndex=2; if(e.Control&&e.KeyCode==Keys.D4)tabs.SelectedIndex=3;};
f.Controls.Add(tabs); Application.Run(f);
