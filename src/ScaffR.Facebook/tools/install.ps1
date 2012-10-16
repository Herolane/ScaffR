param($installPath, $toolsPath, $package, $project)

add-project $facebookProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web,$integrationsProjectName"
get-project | with-reference $facebookProjectName

install-package AutoMapper -ProjectName $facebookProjectName

scaffold Scaffeine.Facebook