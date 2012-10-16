param($installPath, $toolsPath, $package, $project)

scaffold scaffr.backend.for Department

scaffold scaffr.frontend.for Department

scaffold scaffr.backend.for Category

scaffold scaffr.frontend.for Category

add-migration "Department Added" -projectName $dataProjectName

update-database -projectName $dataProjectName
