[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)


$templates = 
 	@("AppStartup.Ninject", `
		"NinjectControllerFactory", `
		"NinjectResolver", `
		"NinjectScope")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $dependencyResolutionProjectName $outputPath $tml -Force:$Force $TemplateFolders
}
