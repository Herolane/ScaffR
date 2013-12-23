[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

$outputPath = "Model\DomainObject"
Add-Template $coreProjectName $outputPath "DomainObject" -Force:$Force $TemplateFolders

$templates = 
 	@("ValidationContainer")

foreach ($tml in $templates){
	$outputPath = "Common\Validation\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

$templates = 
 	@("IDatabaseFactory", `
		"IDataContext", `
		"IRepository", `
		"IUnitOfWork")

foreach ($tml in $templates){
	$outputPath = "Interfaces\Data\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

$outputPath = "Interfaces\Validation\IValidationContainer"
Add-Template $coreProjectName $outputPath "IValidationContainer" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Paging\IPage"
Add-Template $coreProjectName $outputPath "IPage" -Force:$Force $TemplateFolders

$outputPath = "Common\Paging\Page"
Add-Template $coreProjectName $outputPath "Page" -Force:$Force $TemplateFolders