<!-- :: Batch section
@echo off & setlocal
::opens the MSHTA window
for /F "delims=" %%a in ('mshta.exe "%~F0"') do set "HTAreply=%%a"
exit
goto :EOF
-->
<HTML>
<HEAD>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<TITLE>Add New VM</TITLE>
	<meta http-equiv="x-ua-compatible" content="IE=edge">
	<script src="Logic.js"></script>
	<SCRIPT language="JavaScript">
		window.moveTo(0, 0);
		window.resizeTo(screen.availWidth, screen.availHeight);

		function runOnLoad()	{
			readVMDetail('add');
			buildCurrentVMTable();
		}

	</SCRIPT>
	<HTA:APPLICATION SCROLL="no" BORDER="thin">
	<link href="CSS\bootstrap.css" rel="stylesheet" media="all">
	<style>
	</style>
</HEAD>
<BODY class="bg-dark" onload='runOnLoad();'>
	<div class="container-fluid">
		<table class="table table-dark table-striped table-hover" id='newVMForm'>
			<thead>
				<tr class='row m-0'>
					<th class="d-inline-block col-1">Detail Title</th>
					<th class="d-inline-block col-2"></th>
					<th class="d-inline-block col-9">Enter Detail</th>
				</tr>
			</thead>
			<tbody>
				<tr class='row m-0'>
					<td class="d-inline-block col-1">VM Name</td>
					<td class="d-inline-block col-2"><p id='nameValidation' class='text-danger'></p></td>
					<td class="d-inline-block col-9"><input type='text' class="form-control" id='newName' placeholder='VM Name' minlength='5' maxlength='25' required/></td>
				</tr>
				<tr class='row m-0'>
					<td class="d-inline-block col-1">IP Address</td>
					<td class="d-inline-block col-2"><p id='IPValidation' class='text-danger'></p></td>
					<td class="d-inline-block col-9"><input type='text' class="form-control" id='newIP' placeholder='IP Address' required/></td>
				</tr>
				<tr class='row m-0'>
					<td class="d-inline-block col-1">Username</td>
					<td class="d-inline-block col-2"><p id='userValidation' class='text-danger'>Use a space for Username if unknown</p></td>
					<td class="d-inline-block col-9"><input type='text' class="form-control" id='newUsername' placeholder='Username' minlength='1' maxlength='40' required/></td>
				</tr>
				<tr class='row m-0'>
					<td class="d-inline-block col-1">Password</td>
					<td class="d-inline-block col-2"><p id='passValidation' class='text-danger'>Use a space for Password if unknown/security risk</p></td>
					<td class="d-inline-block col-9"><input type='password' class="form-control" id='newPassword' placeholder='Password' minlength='1' maxlength='40' required/></td>
				</tr>
				<tr class='rew m-0'>
					<td class="d-inline-block col-12">Enter at least the Name and IP address of the new server.  Passwords are stored in plain text so use a space for sensitive connections.  Passwords are stored centraly on App Server, leave username and password blank (use a space) on these connections.  Looking to add a chackbox for connections where username and password cant be used</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class='container'>
	<!--Buttons to read input and store it to file, and close the VM adding UI-->
		<div class="d-flex justify-content-center">
			<button type="submit" class="btn btn-outline-primary btn-block" onclick='insertVM();'>+ Add VM</button>
		</div>
		<div class="d-flex justify-content-center mt-1">
			<button class="btn btn-outline-primary btn-block" onclick='exitAndReturn()' id='exitBtn'>Back to Program</button>
		</div>
	</div>
	<!--Table for current VM list with button to remove VM-->
	<div class="container-fluid table-responsive t-5">
		<h1 class='text-white text-center t-5'>Manage VM List:</h1>
		<table class="table table-dark table-striped table-hover" id='MainList'>
			<thead>
				<tr>
					<th>VM IP</th>
					<th>VM Name</th>
				</tr>
			</thead>
			<tbody>
				<!--table should be populated dynamically -->
			</tbody>
		</table>
	</div>
</BODY>
</HTML>