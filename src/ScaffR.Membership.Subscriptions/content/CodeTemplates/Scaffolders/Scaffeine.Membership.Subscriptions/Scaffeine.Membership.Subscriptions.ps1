[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@(	"User.Subscription", `
		"SubscriptionStatus")

foreach ($tml in $templates){
	$outputPath = "Model\$tml"
	Add-Template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}
