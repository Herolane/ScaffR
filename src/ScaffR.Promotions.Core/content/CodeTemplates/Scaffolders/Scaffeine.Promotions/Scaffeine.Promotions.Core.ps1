[T4Scaffolding.Scaffolder(Description = "WC.Payments - Generic Payment Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("BenefitContext", `
		"BenefitProcessor")

foreach ($tml in $templates){
	add-template $coreProjectName "Common\Promotions\Benefits\$tml" $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@("PromotionSettings", `
		"PromotionSettingsCollection")

foreach ($tml in $templates){
	add-template $coreProjectName "Configuration\Promotions\$tml" $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@("PrerequisiteContext", `
		"PrerequisiteProcessor")

foreach ($tml in $templates){
	add-template $coreProjectName "Common\Promotions\Prerequisites\$tml" $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@("Promotion", `
		"PromotionManager")

foreach ($tml in $templates){
	add-template $coreProjectName "Common\Promotions\$tml" $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@("CoreSection.Promotions")

foreach ($tml in $templates){
	add-template $coreProjectName "Configuration\$tml" $tml -Force:$Force $TemplateFolders
}