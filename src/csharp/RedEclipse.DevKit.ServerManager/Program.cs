using System.Diagnostics;
using System.Windows.Forms;

ApplicationConfiguration.Initialize();
var form = new Form{Text="Red Eclipse Server Manager",Width=1100,Height=720,KeyPreview=true};
var split = new SplitContainer{Dock=DockStyle.Fill,Orientation=Orientation.Vertical,SplitterDistance=360};
var list = new ListBox{Dock=DockStyle.Fill};
var console = new TextBox{Dock=DockStyle.Fill,Multiline=true,ScrollBars=ScrollBars.Both};
var players = new ListBox{Dock=DockStyle.Bottom,Height=180};
var top = new FlowLayoutPanel{Dock=DockStyle.Top,Height=42};

var addBtn=new Button{Text="New Server (Ctrl+N)"};
var startBtn=new Button{Text="Start (Ctrl+R)"};
var stopBtn=new Button{Text="Stop (Ctrl+S)"};
var logsBtn=new Button{Text="Refresh Logs (Ctrl+L)"};
var applyCfgBtn=new Button{Text="Apply Variable CFG (Ctrl+V)"};
var cmdBox=new TextBox{Width=300}; var sendBtn=new Button{Text="Send Console"};

var servers=new Dictionary<string,string>();
void AddServer(){var name=$"server-{servers.Count+1}"; servers[name]=$"docker compose -f docker/docker-compose.yml up -d"; list.Items.Add(name);} 
void StartSel(){if(list.SelectedItem is not string s)return; Process.Start(new ProcessStartInfo("cmd.exe",$"/c {servers[s]}"){UseShellExecute=true});}
void StopSel(){if(list.SelectedItem is not string s)return; Process.Start(new ProcessStartInfo("cmd.exe","/c docker compose -f docker/docker-compose.yml down"){UseShellExecute=true});}
void RefreshLogs(){var p=Process.Start(new ProcessStartInfo("cmd.exe","/c docker logs --tail 200 redeclipse-server"){RedirectStandardOutput=true,UseShellExecute=false}); if(p==null)return; console.Text=p.StandardOutput.ReadToEnd(); p.WaitForExit(); players.Items.Clear(); foreach(var ln in console.Lines.Where(l=>l.Contains("connected",StringComparison.OrdinalIgnoreCase))) players.Items.Add(ln);} 
void ApplyCfg(){using var fd=new OpenFileDialog{Filter="CFG files|*.cfg"}; if(fd.ShowDialog()!=DialogResult.OK)return; Process.Start(new ProcessStartInfo("cmd.exe",$"/c copy /Y \"{fd.FileName}\" scripts\\presets\\active.cfg"){UseShellExecute=true});}
void SendCmd(){if(string.IsNullOrWhiteSpace(cmdBox.Text))return; Process.Start(new ProcessStartInfo("cmd.exe",$"/c echo {cmdBox.Text} >> /dev/shm/redeclipse/console.pipe"){UseShellExecute=true});}

addBtn.Click+=(_,_)=>AddServer(); startBtn.Click+=(_,_)=>StartSel(); stopBtn.Click+=(_,_)=>StopSel(); logsBtn.Click+=(_,_)=>RefreshLogs(); applyCfgBtn.Click+=(_,_)=>ApplyCfg(); sendBtn.Click+=(_,_)=>SendCmd();
form.KeyDown += (_,e)=>{if(e.Control&&e.KeyCode==Keys.N){AddServer();} if(e.Control&&e.KeyCode==Keys.R){StartSel();} if(e.Control&&e.KeyCode==Keys.S){StopSel();} if(e.Control&&e.KeyCode==Keys.L){RefreshLogs();} if(e.Control&&e.KeyCode==Keys.V){ApplyCfg();}};

foreach(var c in new Control[]{addBtn,startBtn,stopBtn,logsBtn,applyCfgBtn,cmdBox,sendBtn}) top.Controls.Add(c);
split.Panel1.Controls.Add(list);
split.Panel2.Controls.Add(console); split.Panel2.Controls.Add(players); split.Panel2.Controls.Add(top);
form.Controls.Add(split); Application.Run(form);
