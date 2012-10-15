[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

#scaffold scaffr.frontend.for User
#scaffold scaffr.frontend.for Role
#scaffold scaffr.frontend.for UserRole
#scaffold scaffr.frontend.for Person
#scaffold scaffr.frontend.for UserEmail

Register-ActionFilter "new AuthorizeAttribute()"

Add-CodeToMethod $baseProject.Name "\App_Start\" "NinjectWebCommon.cs" "NinjectWebCommon" "RegisterServices" "kernel.Bind<IAuthenticationService>().To<AuthenticationService>().InRequestScope();"

Add-CodeToMethod (Get-Project).Name "\App_Start\" "FilterConfig.cs" "FilterConfig" "RegisterGlobalFilters" "filters.Add(new Filters.UserContextFilter());"
