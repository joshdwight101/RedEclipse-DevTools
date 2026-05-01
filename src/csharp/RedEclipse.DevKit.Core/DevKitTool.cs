namespace RedEclipse.DevKit.Core;

public record DevKitTool(string Id, string Name, string Description, string ScriptPath);

public static class ToolCatalog
{
    public static IReadOnlyList<DevKitTool> DefaultTools => new[]
    {
        new DevKitTool("map-designer", "Map Designer", "Optimize map geometry and lightmaps", "src/powershell/Tools/MapDesigner/Start-MapDesigner.ps1"),
        new DevKitTool("mutator-builder", "Mutator Builder", "No-code mutator generation", "src/powershell/Tools/MutatorBuilder/Start-MutatorBuilder.ps1"),
        new DevKitTool("asset-pipeline", "Asset Pipeline", "Asset ingestion and conversion helpers", "src/powershell/Tools/AssetPipeline/Start-AssetPipeline.ps1"),
        new DevKitTool("server-orchestrator", "Server Orchestrator", "Dedicated server operations", "src/powershell/Tools/ServerOrchestrator/Start-ServerOrchestrator.ps1")
    };
}
