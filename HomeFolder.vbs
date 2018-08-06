'On Error Resume Next

FileName = "C:\ZenworksInstalls\Logs\HomeFolder.txt"

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set oShell = CreateObject("WScript.Shell")

strHomeFolder = oShell.ExpandEnvironmentStrings("%USERPROFILE%")
strUser = oShell.ExpandEnvironmentStrings("%USERNAME%")

'write file
Set objFile =objFSO.CreateTextFile(FileName, True)
objFile.Write strUser & vbTab & strHomeFolder
objFile.Close