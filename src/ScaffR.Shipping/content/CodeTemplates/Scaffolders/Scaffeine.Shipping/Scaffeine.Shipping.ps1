[T4Scaffolding.Scaffolder(Description = "Scaffeine.Subscriptions - Generic Subscriptions Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("ShippingProvider", `
		"ShippingRateRequest", `
		"ShippingRateResponse")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $shippingProjectName $outputPath $tml -Force:$Force $TemplateFolders
}