[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

add-template $coreProjectName "Interfaces\Service\IProductService.Custom" "IProductService.Custom" -Force:$Force $TemplateFolders
add-template $coreProjectName "Interfaces\Data\IProductRepository.Custom" "IProductRepository.Custom" -Force:$Force $TemplateFolders
 
add-template $serviceProjectName "ProductService.Custom" "ProductService.Custom" -Force:$Force $TemplateFolders

Add-Template $dataProjectName "ProductRepository.Custom" "ProductRepository.Custom" -Force:$Force $TemplateFolders


