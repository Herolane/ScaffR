[T4Scaffolding.Scaffolder(Description = "Scaffeine.ShippingRates - Generic ShippingRates Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@(	"ShippingRateResponse", `
		"ShippingRateRequest", `
		"ShippingRatesManager", `
		"ShippingRatesProvider", `
		"ShippingRatesProviderCollection", `
		"ShippingRatesSection")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $shippingRatesProjectName $outputPath $tml -Force:$Force $TemplateFolders
}