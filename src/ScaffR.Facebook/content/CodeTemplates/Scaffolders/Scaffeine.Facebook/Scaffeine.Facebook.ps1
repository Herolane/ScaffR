[T4Scaffolding.Scaffolder(Description = "Scaffine.Facebook")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("FacebookProvider")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $facebookProjectName $outputPath $tml -Force:$Force $TemplateFolders
}