using RedEclipse.DevKit.Core;

Console.WriteLine("Red Eclipse Ultimate Developer Toolkit - GUI Shell");
Console.WriteLine("Mini App Catalog:");
foreach (var tool in ToolCatalog.DefaultTools)
{
    Console.WriteLine($"- {tool.Name}: {tool.Description}");
}
Console.WriteLine("Use platform-specific GUI host wrappers to present this catalog visually.");
