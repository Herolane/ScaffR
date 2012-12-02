Function Register-ActionFilter($filter){	
	Add-CodeToMethod $baseProject.Name "\Bootstrappers\" "Bootstrapper.ActionFilters.cs" "Bootstrapper" "ActionFilters" "GlobalFilters.Filters.Add($filter);"
}

Export-ModuleMember -Function *
