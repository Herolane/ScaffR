[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-Domain "Model\Lead" "Lead" -Force:$Force $TemplateFolders

Add-Domain "Model\Customer.Lead" "Customer.Lead" -Force:$Force $TemplateFolders

Add-Domain "Model\Order.Lead" "Order.Lead" -Force:$Force $TemplateFolders


