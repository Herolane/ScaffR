[T4Scaffolding.Scaffolder(Description = "WC.Payments - Generic Payment Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("AuthorizationRequest", `
		"AuthorizationResponse", `
		"CaptureRequest", `
		"CaptureResponse", `
		"PaymentProvider", `
		"PaymentProviderCollection", `
		"PaymentsManager", `
		"PaymentsSection", `
		"PaymentTransaction")

foreach ($tml in $templates){
	add-template $paymentProjectName $tml $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@("HttpGetStrategy", `
		"HttpPostStrategy")

foreach ($tml in $templates){
	$outputPath = "Infrasctucture\$tml"
	add-template $paymentProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@(	"IRequest", `
		"IRequestFactory", `
		"IRequestStrategy", `
		"IResponse")

foreach ($tml in $templates){
	$outputPath = "Interfaces\$tml"
	add-template $paymentProjectName $outputPath $tml -Force:$Force $TemplateFolders
}