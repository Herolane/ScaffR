param($installPath, $toolsPath, $package, $project)

Add-TestProject $recurlyUnitTestProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web,$recurlyProjectName"

scaffold Subscriptions.Recurly.UnitTests