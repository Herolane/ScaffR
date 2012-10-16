[T4Scaffolding.Scaffolder(Description = "WC.Payments - Generic Payment Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("IntegrationsManager", `
		"IntegrationProvider", `
		"IntegrationProviderCollection", `
		"IntegrationsSection")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $integrationsProjectName $outputPath $tml -Force:$Force $TemplateFolders
}