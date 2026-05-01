using System.Text.Json;

namespace RedEclipse.DevKit.ProjectSystem;

public class DevKitProject
{
    public string Name { get; set; } = "new_project";
    public string Tool { get; set; } = "asset-manager";
    public Dictionary<string, string> Parameters { get; set; } = new();
    public DateTime UpdatedUtc { get; set; } = DateTime.UtcNow;

    public static DevKitProject Load(string path)
    {
        var json = File.ReadAllText(path);
        return JsonSerializer.Deserialize<DevKitProject>(json) ?? new DevKitProject();
    }

    public void Save(string path)
    {
        UpdatedUtc = DateTime.UtcNow;
        var json = JsonSerializer.Serialize(this, new JsonSerializerOptions { WriteIndented = true });
        Directory.CreateDirectory(Path.GetDirectoryName(path)!);
        File.WriteAllText(path, json);
    }
}
