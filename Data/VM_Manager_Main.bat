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
	<TITLE>Test VM Avalability</TITLE>
	<meta http-equiv="x-ua-compatible" content="IE=edge">
	<script src="Logic.js"></script>
	<SCRIPT language="JavaScript">
		window.moveTo(0, 0);
		window.resizeTo(screen.availWidth, screen.availHeight);
		window.onbeforeunload = cleanUp;

		//Once the program is closed, clean up tempory files
		//Found it easiest to create a batch file for this as JS does not handle local files well
		function cleanUp() {
			var path = mainPath + '\\cleanUp.bat';
			var fso = new ActiveXObject("Scripting.FileSystemObject");
			s = fso.OpenTextFile(path, 2, true);
			s.WriteLine('@echo off & setlocal');
			s.WriteLine('del /q ' + mainPath + '\\checkVMs.bat');
			s.WriteLine('del /q ' + mainPath + '\\loaded.txt');
			s.WriteLine('del /q ' + mainPath + '\\makeConnection.bat');
			s.WriteLine('del /q ' + mainPath + '\\start.bat');
			s.WriteLine('del /q ' + mainPath + '\\WinCreds.bat');
			s.WriteLine('del /q data\\currentUserTempPath.txt');
			for (let i = 0; i < VMDetail.length; i++) {
				s.WriteLine('del /q ' + mainPath + '\\srv' + [i] + 'qwinsta.txt');
				s.WriteLine('del /q ' + mainPath + '\\checkVM' + [i] + '.bat');
				s.WriteLine('del /q ' + mainPath + '\\svr' + [i] + 'availability.txt');
				s.WriteLine('del /q ' + mainPath + '\\loaded' + [i] + '.txt');
			}
			s.WriteLine('del /q ' + mainPath + '\\cleanUp.bat');
			s.WriteLine('exit /b');
			s.Close();

			var fso2 = new ActiveXObject("wscript.shell");
			fso2.Run(mainPath + '\\cleanUp.bat');
		}
		function runOnLoad()	{
			readUserPath();
			readVMDetail();
			startUp();
			testConnection();
			checkUsage('fromMain');
		}

		//SYSMENU="no" SHOWINTASKBAR="no"
		// ^^ Some additional settings to change the look of the window.  Put them in the <HTA> tag below
		//These MSHTA attributes are not compatable with IE version > 9.  Since this is using 'edge', these will have no effect
	</SCRIPT>
	<HTA:APPLICATION SCROLL="no" BORDER="thin">
	<link href="CSS\bootstrap.css" rel="stylesheet" media="all">
	<style>
		table {
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}
		td, th {
			border: 1px solid #dddddd;
			text-align: left;
			padding: 8px;
		}
	</style>
</HEAD>
<!-- Dont know if its bad practice to have this many onload functions or if they should call eachother -->
<BODY onload="runOnLoad();" class="bg-dark">
	<div class="container-fluid">
		<div class="container-fluid table-responsive">
			<table class="table table-dark table-striped table-hover" id='MainList'>
				<thead>
					<tr>
						<th>VM IP</th>
						<th>VM Name</th>
						<th>Avalability</th>
					</tr>
				</thead>
				<tbody>
					<!--table should be populated automatically on startup-->
				</tbody>
			</table>
		</div>
		<div class='container'>
			<button class="btn btn-outline-primary btn-block" onclick="refresh();">
				Refresh (Auto refreshes every 5 minuites)
			</button>
			<div class="d-flex justify-content-center">
				<div class="spinner-border text-primary m-5" role="status" id="buttonLoader">
					<span class="sr-only">Loading...</span>
				</div>
			</div>
		</div>
	</div>
</BODY>
</HTML>