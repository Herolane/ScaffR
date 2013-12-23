[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)


$templates = 
 	@("BaseContext", `
		"BaseRepository", `
		"DatabaseFactory", `
		"DataContext", `
		"UnitOfWork")

foreach ($tml in $templates){
	$outputPath = "Data\$tml"
	add-template $infrastructureProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

$outputPath = "Migrations\Configuration"
Add-Template $infrastructureProjectName $outputPath "Configuration" -Force:$Force $TemplateFolders