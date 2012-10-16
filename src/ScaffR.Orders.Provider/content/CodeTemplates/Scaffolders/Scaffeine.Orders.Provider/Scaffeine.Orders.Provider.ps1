[T4Scaffolding.Scaffolder(Description = "Scaffeine.Order - Generic Order Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@(	"OrderManager", `
		"OrderProvider", `
		"OrderProviderCollection", `
		"OrderSection")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $ordersProjectName $outputPath $tml -Force:$Force $TemplateFolders
}