using System.Diagnostics;

namespace RedEclipse.DevKit.Windows.Common;

public static class PowerShellRunner
{
    public static ProcessStartInfo Build(string scriptPath, string arguments = "")
    {
        return new ProcessStartInfo
        {
            FileName = "powershell.exe",
            Arguments = $"-ExecutionPolicy RemoteSigned -File \"{scriptPath}\" {arguments}",
            UseShellExecute = false,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            CreateNoWindow = true
        };
    }
}
