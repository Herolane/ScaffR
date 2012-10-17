[T4Scaffolding.Scaffolder(Description = "WC.Payments - Generic Payment Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("MLMProvider")

foreach ($tml in $templates){
	$outputPath = "Common\Organizations\Providers\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}