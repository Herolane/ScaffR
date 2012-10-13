Function Register-EventHandler($instance){	
	Add-CodeToMethod (Get-Project).Name "\App_Start\" "EventBootstrapper.cs" "EventBootstrapper" "RegisterEventHandlers" "MessageBus.Instance.Subscribe($instance);"	
}

Export-ModuleMember -Function *
