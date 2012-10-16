[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

$class = Get-ProjectType DataContext -Project $dataProjectName
 
Add-ClassMemberViaTemplate -CodeClass $class -Template "DataContext.ModelCreating" -Model @{} -TemplateFolders $TemplateFolders -Project $dataProjectName

add-template $dataProjectName "LeadRepository.Custom" "LeadRepository.Custom" -Force:$Force $TemplateFolders

