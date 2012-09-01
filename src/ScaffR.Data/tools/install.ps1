﻿param($installPath, $toolsPath, $package, $project)

Add-Project $dataProjectName | With-Reference "System.ServiceModel,System.Runtime.Serialization,$coreProjectName"

Get-Project | With-Reference $dataProjectName

$App_Data = (get-solution).Path + $baseProject.Name  + "\App_Data"
if(!(Test-Path $App_Data)){
	Write-Host "Adding App_Data to" $baseProject
	$baseProject.ProjectItems.AddFolder("App_Data")
}

Install-Package EntityFramework.SqlServerCompact -Version 4.3.3

Scaffold ScaffR.Data