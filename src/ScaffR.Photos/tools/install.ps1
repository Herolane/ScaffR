param($installPath, $toolsPath, $package, $project)

add-project $coreProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web,System.Drawing"


scaffold Scaffeine.Photos