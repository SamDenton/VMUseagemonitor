<!-- :: Batch section
@echo off & setlocal
::Create a text doc with the path of the current user
set userPath = %userprofile%
echo %userprofile%> \\KSL-APP1\\VM_Manager\\data\\currentUserTempPath.txt
echo %userprofile%>> \\KSL-APP1\\VM_Manager\\data\\log.txt
echo %userprofile%> %userprofile%\\appdata\\local\\temp\\lastUserTempPath.txt
::opens a MSHTA window.  HTAreply allows a response to the command line
for /F "delims=" %%a in ('mshta.exe "%~F0"') do set "HTAreply=%%a"
goto :EOF
-->
<HTML>
<head>
	<title>Loading</title>
	<meta http-equiv="x-ua-compatible" content="IE=edge">
	<HTA:APPLICATION BORDER="none" SCROLL="no" SYSMENU="no" SHOWINTASKBAR="no">
	<script src="\\KSL-APP1\VM_Manager\Data\Logic.js"></script>
	<script language="JavaScript">
		window.moveTo(screen.availWidth/2-screen.availWidth/4, screen.availHeight/2-screen.availHeight/4);
		window.resizeTo(screen.availWidth/4, screen.availHeight/4);

		function runOnLoad()	{
			readUserPath();
			readVMDetail();
			checkStatus();
		}

	</script>
	<link href="data\CSS\bootstrap.css" rel="stylesheet" media="all">
	<style>
	</style>
</head>
<body onload="runOnLoad();" class="bg-dark">
	<div class="content">
		<div class'row align-items-center'>
			<h1 class='text-muted'>Loading...</h>
			<div class="spinner-border text-muted"></div>
		</div>
	</div>
</body>
</HTML>