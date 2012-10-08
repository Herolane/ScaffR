[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("Scaffolder")

foreach ($tml in $templates){
	$outputPath = "Content\CodeTemplates\Scaffolders\$Project\$Project"
	add-template $Project $outputPath $tml -Force:$true $TemplateFolders
}

$templates = @("install")

foreach ($tml in $templates){
	$outputPath = "tools\$tml"
	Add-TemplateWithModel $Project $outputPath $tml @{ ProjectName = $Project } -Force:$Force $TemplateFolders
}

$templates = @("nuspec")

foreach ($tml in $templates){
	$outputPath = "Package"
	Add-TemplateWithModel $Project $outputPath $tml @{ ProjectName = $Project } -Force:$Force $TemplateFolders
}