[T4Scaffolding.Scaffolder(Description = "Payments.AuthNet - Builds the classes for the Authorize.Net payment provider")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = @("App", "Mother")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $recurlyUnitTestProjectName $outputPath $tml -Force:$True $TemplateFolders
}

 $templates = @("WhenCreatingSubscription")

foreach ($tml in $templates){
	$outputPath = "RecurlySubscriptionProvider_Tests\$tml"
	add-template $recurlyUnitTestProjectName $outputPath $tml -Force:$Force $TemplateFolders
}