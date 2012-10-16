[T4Scaffolding.Scaffolder(Description = "Scaffeine.Order - Generic Order Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

$templates = @("ShoppingCart", "ShoppingCartItem")

foreach ($tml in $templates){
	$outputPath = "Model\$tml"
	Add-Domain $outputPath $tml -Force:$Force $TemplateFolders
}

$templates = @("ShoppingCartExtensions", "ShoppingCartItemExtensions")

foreach ($tml in $templates){
	$outputPath = "Common\ShoppingCart\Extensions\$tml"
	Add-Template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}