param($installPath, $toolsPath, $package, $project)

add-project $identityModelProjectName | with-reference "System.IdentityModel,System.IdentityModel.Services,System.ServiceModel,System.Runtime.Serialization,System.Net.Http,System.Web,System.Web.Http,System.Web.Mvc,System.Net.Http.Formatting"

install-package newtonsoft.json -project $identityModelProjectName

get-project | with-reference $identityModelProjectName

scaffold scaffr.identitymodel