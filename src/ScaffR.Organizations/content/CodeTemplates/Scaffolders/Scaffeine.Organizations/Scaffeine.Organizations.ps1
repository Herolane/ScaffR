[T4Scaffolding.Scaffolder(Description = "WC.Payments - Generic Payment Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

$templates = 
 	@("CoreSection.Organizations")

foreach ($tml in $templates){
	$outputPath = "Configuration\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

$templates = 
 	@("OrganizationSettings","OrganizationProviderCollection")

foreach ($tml in $templates){
	$outputPath = "Configuration\Organizations\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

$templates = 
 	@("OrganizationProvider","OrganizationManager")

foreach ($tml in $templates){
	$outputPath = "Common\Organizations\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}