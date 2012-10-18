param($installPath, $toolsPath, $package, $project)

Scaffold ScaffR.Backend.For Department

Scaffold ScaffR.Backend.For Category

add-migration "Department Added" -projectName $dataProjectName

update-database -projectName $dataProjectName
