[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

add-template $coreProjectName "Interfaces\Service\IMessageService.Custom" "IMessageService.Custom" -Force:$Force $TemplateFolders
add-template $coreProjectName "Interfaces\Data\IMessageRepository.Custom" "IMessageRepository.Custom" -Force:$Force $TemplateFolders

add-template $serviceProjectName "MessageService.Custom" "MessageService.Custom" -Force:$Force $TemplateFolders
 
Add-Template $dataProjectName "MessageRepository.Custom" "MessageRepository.Custom" -Force:$Force $TemplateFolders
Add-Template $dataProjectName "Seeders\InboxDataSeeder" "InboxDataSeeder" -Force:$Force $TemplateFolders

add-migration "Inbox Added" -Project $dataProjectName
update-database -Project $dataProjectName

Add-CodeToMethod (Get-Project $dataProjectName).Name "\Migrations\" "Configuration.cs" "Configuration" "Seed" "new Seeders.InboxDataSeeder().Seed(context);"