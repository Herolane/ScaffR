[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-CodeToMethod (Get-Project).Name "\App_Start\" "FilterConfig.cs" "FilterConfig" "RegisterGlobalFilters" "filters.Add(new Filters.FillDropDowns());"