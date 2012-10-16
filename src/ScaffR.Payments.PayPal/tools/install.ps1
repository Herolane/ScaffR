param($installPath, $toolsPath, $package, $project)

add-project $paypalProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web,$paymentProjectName"
get-project | with-reference $paypalProjectName

scaffold Payments.AuthNet