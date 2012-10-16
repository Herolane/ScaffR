param($installPath, $toolsPath, $package, $project)

add-project $shippingProjectName | with-reference "System.Configuration"

get-project | with-reference $shippingProjectName

scaffold Scaffeine.Shipping