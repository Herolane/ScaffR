[T4Scaffolding.Scaffolder(Description = "Scaffeine.Payments.PayPal - Builds the classes for the PayPal payment provider")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

foreach ($tml in @("PayPalPaymentProvider")){
	$outputPath = $tml
	add-template $authNetProjectName $outputPath $tml -Force:$force $TemplateFolders
}