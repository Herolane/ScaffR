param($installPath, $toolsPath, $package, $project)

Scaffold ScaffR.Data.EntityFramework

register-backend "ScaffR.Repository.For"

Enable-Migrations -EnableAutomaticMigrations -ProjectName $dataProjectName

#Add-Migration "Database Created" -ProjectName $dataProjectName

#update-database -ProjectName $dataProjectName