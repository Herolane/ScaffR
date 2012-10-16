param($installPath, $toolsPath, $package, $project)

scaffold scaffeine.leads.services

build-project

scaffold scaffr.backend.for Lead
scaffold scaffr.backend.for Product
scaffold scaffr.backend.for Order
scaffold scaffr.backend.for Customer
scaffold scaffr.backend.for OrderLineItem

add-migration "Leads Added" -projectName $dataProjectName

update-database -projectName $dataProjectName
