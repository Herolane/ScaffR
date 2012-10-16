[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("CancelSubscriptionRequest", `
		"CancelSubscriptionResponse", `
		"AccountRequest", `
		"AccountResponse", `
		"SubscriptionsManager", `
		"SubscriptionsProvider")

foreach ($tml in $templates){
	$outputPath = "Common\Subscriptions\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@("SubscriptionsElement", `
		"SubscriptionsProviderCollection")

foreach ($tml in $templates){
	$outputPath = "Configuration\Subscriptions\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@("CoreSection.Subscriptions")

foreach ($tml in $templates){
	$outputPath = "Configuration\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}