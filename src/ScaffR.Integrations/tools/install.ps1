param($installPath, $toolsPath, $package, $project)

add-project $integrationsProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web"

get-project | with-reference $integrationsProjectName

scaffold Scaffeine.Integrations