namespace RedEclipse.DevKit.Windows.Common;

public static class ToolkitPaths
{
    public static string Root => AppContext.BaseDirectory;
    public static string Script(string relative) => Path.GetFullPath(Path.Combine(Root, "..", "..", "..", "..", relative));
}
