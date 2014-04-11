[T4Scaffolding.Scaffolder(Description = "ScaffR.Order - Generic Order Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

$templates = 
 	@("Product")

foreach ($tml in $templates){
	$outputPath = "Model\$tml"
	Add-Domain $outputPath $tml -Force:$Force $TemplateFolders
}

Scaffold ScaffR.Backend.For Product

add-migration "Products Added" -projectName $dataProjectName

update-database -projectName $dataProjectName