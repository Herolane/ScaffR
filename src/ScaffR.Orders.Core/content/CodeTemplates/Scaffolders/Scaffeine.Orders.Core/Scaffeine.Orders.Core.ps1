[T4Scaffolding.Scaffolder(Description = "Scaffeine.Order - Generic Order Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@(	"Order", `
		"OrderLineItem", `
		"OrderStatus", `
		"SessionInformation")

foreach ($tml in $templates){
	$outputPath = "Model\$tml"
	Add-Domain $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@(	"OrderExtensions", `
		"OrderLineItemExtensions")

foreach ($tml in $templates){
	$outputPath = "Common\Ordering\Extensions\$tml"
	Add-Template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@(	"OrderingElement" )

foreach ($tml in $templates){
	$outputPath = "Configuration\Ordering\$tml"
	Add-Template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@(	"CoreSection.Ordering" )

foreach ($tml in $templates){
	$outputPath = "Configuration\$tml"
	Add-Template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@(	"OrderContext", `
		"OrderLineContext", `
		"OrderLineProcessor", `
		"PostOrderProcessor", `
		"PreOrderProcessor")

foreach ($tml in $templates){
	$outputPath = "Common\Ordering\$tml"
	Add-Template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@(	"MarkAsShipped", `
		"RemoveFromInventory", `
		"UpdateAvailableQuantity")

foreach ($tml in $templates){
	$outputPath = "Common\Ordering\Filters\OrderItems\$tml"
	Add-Template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@(	"CheckFraudFilter", `
		"CheckInventory", `
		"MarkAsCompleted", `
		"OrderItemsShippedFilter", `
		"PreAuthCreditCard", `
		"ProcessOrderLineItems", `
		"SendEmailFilter", `
		"SettleAuthorization", `
		"UpdateFraudCheck")

foreach ($tml in $templates){
	$outputPath = "Common\Ordering\Filters\Orders\$tml"
	Add-Template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}