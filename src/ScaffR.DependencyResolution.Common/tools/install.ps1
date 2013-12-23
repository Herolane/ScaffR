param($installPath, $toolsPath, $package, $project)

Add-Project $dependencyResolutionProjectName | With-Reference "$coreProjectName,$infrastructureProjectName,System.Web"

get-project | With-Reference "$dependencyResolutionProjectName"

install-package Microsoft.AspNet.Mvc -project $dependencyResolutionProjectName
install-package Microsoft.AspNet.WebApi.Core -project $dependencyResolutionProjectName
install-package Ninject.AspNet.WebApi.Core -project $dependencyResolutionProjectName
install-package ScaffR.DependencyResolution.Ninject -project $dependencyResolutionProjectName

scaffold scaffr.dependencyResolution
