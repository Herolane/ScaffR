[T4Scaffolding.Scaffolder(Description = "Payments.AuthNet - Builds the classes for the Authorize.Net payment provider")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("Authentication", `
		"AuthNetProvider", `
		"AuthNetRequest", `
		"AuthNetRequestBuilder", `
		"AuthNetResponse", `
		"AuthType", `
		"AVSResponse", `
		"Card", `
		"Customer", `
		"Merchant", `
		"Product", `
		"ResponseCode", `
		"Ship", `
		"TestMode", `
		"Transaction")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $authNetProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@("AuthNetRequestNameValueCollectionMapper", `
		"AuthNetResponseAuthorizationResponseMapper", `
		"AuthNetResponseCaptureResponseMapper", `
		"AuthorizationRequestAuthNetRequestMapper", `
		"CaptureRequestAuthNetRequestMapper")

foreach ($tml in $templates){
	$outputPath = "Mappers\$tml"
	add-template $authNetProjectName $outputPath $tml -Force:$Force $TemplateFolders
}