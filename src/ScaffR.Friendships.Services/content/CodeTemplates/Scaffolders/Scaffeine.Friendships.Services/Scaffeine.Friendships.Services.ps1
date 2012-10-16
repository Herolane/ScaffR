[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("IFriendshipService.Custom")

foreach ($tml in $templates){
	$outputPath = "Interfaces\Service\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@("FriendshipService.Custom")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $serviceProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

Add-Template $dataProjectName "FriendshipRepository.Custom" "FriendshipRepository.Custom" -Force:$Force $TemplateFolders
Add-Template $dataProjectName "Seeders\FriendshipsDataSeeder" "FriendshipsDataSeeder" -Force:$Force $TemplateFolders

add-migration "Friendship Added" -Project $dataProjectName
update-database -Project $dataProjectName

Add-CodeToMethod (Get-Project $dataProjectName).Name "\Migrations\" "Configuration.cs" "Configuration" "Seed" "new Seeders.FriendshipsDataSeeder().Seed(context);"

#update-database -ProjectName $dataProjectName


