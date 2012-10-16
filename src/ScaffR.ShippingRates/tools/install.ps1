param($installPath, $toolsPath, $package, $project)

add-project $shippingRatesProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web"

get-project | with-reference $shippingRatesProjectName

scaffold Scaffeine.ShippingRates