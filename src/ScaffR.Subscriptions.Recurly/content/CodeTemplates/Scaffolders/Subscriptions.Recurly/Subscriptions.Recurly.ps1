[T4Scaffolding.Scaffolder(Description = "Payments.AuthNet - Builds the classes for the Authorize.Net payment provider")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("ForgedQueryStringException", `
		"InvalidCredentialsException", `
		"NotFoundException", `
		"RecurlyAccount", `
		"RecurlyAccountCoupon", `
		"RecurlyBillingInfo", `
		"RecurlyCharge", `
		"RecurlyClient", `
		"RecurlyCredit", `
		"RecurlyCreditCard", `
		"RecurlyError", `
		"RecurlyException", `
		"RecurlyInvoice", `
		"RecurlyInvoiceList", `
		"RecurlyLineItem", `
		"RecurlyLineItemList", `
		"RecurlyPlan", `
		"RecurlyServerException", `
		"RecurlySubscription", `
		"RecurlySubscriptionProvider", `
		"RecurlyTransaction", `
		"RecurlyTransactionList", `
		"RecurlyTransparent", `
		"TemporarilyUnavailableException", `
		"ValidationException")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $recurlyProjectName $outputPath $tml -Force:$Force $TemplateFolders
}