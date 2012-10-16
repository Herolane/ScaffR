[T4Scaffolding.Scaffolder(Description = "Scaffeine.Order - Generic Order Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

$templates = 
 	@("Department", "Category.Department")

foreach ($tml in $templates){
	$outputPath = "Model\$tml"
	Add-Domain $outputPath $tml -Force:$Force $TemplateFolders
}