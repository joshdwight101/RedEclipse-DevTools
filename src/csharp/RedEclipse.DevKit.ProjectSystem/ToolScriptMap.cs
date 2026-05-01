namespace RedEclipse.DevKit.ProjectSystem;

public static class ToolScriptMap
{
    public static readonly Dictionary<string, string> Scripts = new(StringComparer.OrdinalIgnoreCase)
    {
        ["asset-manager"] = "src/powershell/Tools/AssetManager/Start-AssetManager.ps1",
        ["asset-pipeline"] = "src/powershell/Tools/AssetPipeline/Start-AssetPipeline.ps1",
        ["map-designer"] = "src/powershell/Tools/MapDesigner/Start-MapDesigner.ps1",
        ["model-manager"] = "src/powershell/Tools/ModelManager/Start-ModelManager.ps1",
        ["mutator-builder"] = "src/powershell/Tools/MutatorBuilder/Start-MutatorBuilder.ps1",
        ["procedural-world-builder"] = "src/powershell/Tools/ProceduralWorldBuilder/Start-ProceduralWorldBuilder.ps1",
        ["server-orchestrator"] = "src/powershell/Tools/ServerOrchestrator/Start-ServerOrchestrator.ps1",
        ["variable-preset-manager"] = "src/powershell/Tools/VariablePresetManager/Start-VariablePresetManager.ps1"
    };
}
