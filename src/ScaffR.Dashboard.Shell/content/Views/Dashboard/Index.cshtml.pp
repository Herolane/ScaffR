@{
	ViewBag.Title = "Dashboard";    
	Layout = "~/Views/Shared/_Folder.cshtml";
}

<div class="row-fluid">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="#todo" data-toggle="tab">
                To-Do List
            </a> 
        </li>
        <li>
            <a href="#calendar" data-toggle="tab">
                Calendar
            </a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="todo">
            See if we need ToDo package
        </div>
        <div class="tab-pane" id="calendar">
            See if we need Calendar package
        </div>
    </div>
</div>