param($installPath, $toolsPath, $package, $project)

scaffold scaffr.frontend.for ActivityLog -withbackend
Register-EventHandler "Handlers.LastActivityHandler.Instance"