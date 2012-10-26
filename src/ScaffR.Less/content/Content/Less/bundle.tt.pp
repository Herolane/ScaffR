<#@ template  debug="true" hostSpecific="true" #>
<#@ output extension=".txt" #>
<#@ Assembly Name="System.Core.dll" #>
<#@ Assembly Name="System.Windows.Forms.dll" #>
<#@ import namespace="System" #>
<#@ import namespace="System.IO" #>
<#@ import namespace="System.Diagnostics" #>
<#@ import namespace="System.Linq" #>
<#@ import namespace="System.Collections" #>
<#@ import namespace="System.Collections.Generic" #> 
site.less

[references]
<#
	var x = new DirectoryInfo(Host.ResolvePath(""));
	if (x != null){
		foreach(var dir in x.GetDirectories()){
			WriteLine(string.Format("~/content/less/{0}", dir.Name));
		}
	}	
#>