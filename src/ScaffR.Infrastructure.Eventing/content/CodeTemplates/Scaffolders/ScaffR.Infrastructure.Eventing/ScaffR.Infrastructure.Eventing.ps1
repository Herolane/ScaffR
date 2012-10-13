[T4Scaffolding.Scaffolder(Description = "ScaffR.Architecture - Setup of projects and references in solution.")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

$outputPath = "Interfaces\Eventing\IHandles"
Add-Template $coreProjectName $outputPath "IHandles" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Eventing\IMessageBus"
Add-Template $coreProjectName $outputPath "IMessageBus" -Force:$Force $TemplateFolders

$outputPath = "Infrastructure\Eventing\MessageBus"
Add-Template $coreProjectName $outputPath "MessageBus" -Force:$Force $TemplateFolders
