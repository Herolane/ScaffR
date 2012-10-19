@using $rootnamespace$.Core.Model
@using $rootnamespace$.Extensions
@model string


<img width="50" src="@Url.ProfilePicture(Model, "Small", Gender.Male)"/>