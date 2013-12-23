param($installPath, $toolsPath, $package, $project)

Add-Project $coreProjectName | With-Reference "System.ComponentModel.DataAnnotations"

Get-Project | with-reference $coreProjectName

scaffold ScaffR.Core