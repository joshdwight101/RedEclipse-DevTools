using System.Diagnostics;
using RedEclipse.DevKit.ProjectSystem;

var root = Directory.GetCurrentDirectory();
var argsList = args.ToList();
if (argsList.Count == 0)
{
    Console.WriteLine("Commands: new <tool> <name>, run <project.json>, save <project.json> key=value... , list-tools");
    return;
}

switch (argsList[0])
{
    case "list-tools":
        foreach (var t in ToolScriptMap.Scripts.Keys.OrderBy(x => x)) Console.WriteLine(t);
        break;
    case "new":
        {
            var tool = argsList.ElementAtOrDefault(1) ?? "asset-manager";
            var name = argsList.ElementAtOrDefault(2) ?? "new_project";
            var p = new DevKitProject { Name = name, Tool = tool };
            var path = Path.Combine("projects", $"{name}.devkit.json");
            p.Save(path);
            Console.WriteLine(path);
            break;
        }
    case "save":
        {
            var path = argsList.ElementAtOrDefault(1) ?? throw new Exception("project path required");
            var p = File.Exists(path) ? DevKitProject.Load(path) : new DevKitProject();
            foreach (var kv in argsList.Skip(2))
            {
                var split = kv.Split('=', 2);
                if (split.Length == 2) p.Parameters[split[0]] = split[1];
            }
            p.Save(path);
            Console.WriteLine($"saved {path}");
            break;
        }
    case "run":
        {
            var path = argsList.ElementAtOrDefault(1) ?? throw new Exception("project path required");
            var p = DevKitProject.Load(path);
            if (!ToolScriptMap.Scripts.TryGetValue(p.Tool, out var script)) throw new Exception("unknown tool");
            var shell = OperatingSystem.IsWindows() ? "powershell" : "pwsh";
            var psArgs = string.Join(' ', p.Parameters.Select(kv => $"-{kv.Key} \"{kv.Value}\""));
            var psi = new ProcessStartInfo(shell, $"-ExecutionPolicy RemoteSigned -File \"{Path.Combine(root, script)}\" {psArgs}") { UseShellExecute = false };
            var proc = Process.Start(psi) ?? throw new Exception("failed to start");
            proc.WaitForExit();
            break;
        }
}
