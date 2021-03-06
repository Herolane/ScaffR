﻿@model $rootnamespace$.Models.ForgotPasswordModel

@{
    ViewBag.Title = "Forgot Password";
}

<div class="page-header">
    <h2>Forgot Password</h2>
</div>

@using (Html.BeginForm("ForgotPassword", "Account", FormMethod.Post, new { @class = "form-horizontal" }))
{
    @Html.ValidationSummary(true, "Unable to retrieve password. Please correct the errors and try again.", new { @class = "alert alert-block alert-error" })
    
    @Html.EditorForModel("Bootstrap/Bootstrap.Form")
    <div class="form-actions">
        <button class="btn btn-primary">Retrieve Password</button>
    </div>
}