# VMUseageMonitor
An internal tool I built for monitoring the use of our VM's

SETUP:
-First, map the shared folder to a network drive.  In file explorer on 'this PC', click 'computer' at the top, and click map network drive
-Pick a drive letter EG 'V' and paste the shared folder into the directory
-Then create a shortcut and copy it to desktop
-If you use drive letter V, you can copy the existing shortcut

USAGE:
-Run 'VM_Manager.bat' to open program
-If Server List file gets messed up there is a backup of original
-There is only basic input validation on form so avoid special chars for now
-Let me (Sam De) know if you find issues so I can fix, including spelling mistakes, which are many...

ADD NEW VMs:
-To add a new server to this tool, click the add button at the bottom of the server list and use the UI to enter details
-The VM will need group pilocy setting so it auto-logs of disconnected users after 5 mins, and idle after an hour
-VM's registary needs to be configured to allow remote RPC:

HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server

-and change AllowRemoteRPC from 0 to the 1
