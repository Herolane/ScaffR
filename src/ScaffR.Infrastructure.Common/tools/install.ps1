param($installPath, $toolsPath, $package, $project)

Add-Project $infrastructureProjectName | With-Reference "$coreProjectName,System.ServiceModel,System.Configuration,System.Web,System.Runtime.Serialization,System.ComponentModel.DataAnnotations"

get-project | With-Reference "$infrastructureProjectName"

scaffold scaffr.infrastructure
