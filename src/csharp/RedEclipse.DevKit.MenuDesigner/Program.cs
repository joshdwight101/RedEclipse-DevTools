using System.Text;

Console.WriteLine("Red Eclipse Menu Designer");
Console.Write("Menu name: ");
var menu = Console.ReadLine()?.Trim();
if (string.IsNullOrWhiteSpace(menu)) return;

var buttons = new List<(string Label,string Command)>();
while (true)
{
    Console.Write("Button label (blank to finish): ");
    var label = Console.ReadLine();
    if (string.IsNullOrWhiteSpace(label)) break;
    Console.Write("Button command: ");
    var command = Console.ReadLine() ?? "echo missing";
    buttons.Add((label, command));
}

var sb = new StringBuilder();
sb.AppendLine($"alias {menu}_open [ showgui {menu} ]");
sb.AppendLine($"newgui {menu} [");
sb.AppendLine("  guilist [");
foreach (var b in buttons)
    sb.AppendLine($"    guibutton \"{b.Label}\" [ {b.Command} ]");
sb.AppendLine("  ]");
sb.AppendLine("]");
sb.AppendLine($"echo \"Menu installed. Use: /{menu}_open\"");

Directory.CreateDirectory("scripts/menus");
var output = Path.Combine("scripts/menus", $"{menu}.cfg");
File.WriteAllText(output, sb.ToString());
Console.WriteLine($"Generated: {output}");

Console.Write("Install to Red Eclipse data/scripts path now? (y/N): ");
if ((Console.ReadLine() ?? "").Equals("y", StringComparison.OrdinalIgnoreCase))
{
    Console.Write("Path: ");
    var target = Console.ReadLine();
    if (!string.IsNullOrWhiteSpace(target))
    {
        Directory.CreateDirectory(Path.Combine(target, "scripts"));
        File.Copy(output, Path.Combine(target, "scripts", Path.GetFileName(output)), true);
        Console.WriteLine("Installed. In-game: /exec scripts/" + Path.GetFileName(output));
    }
}
