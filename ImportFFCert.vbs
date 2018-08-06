Option Explicit
On Error Resume Next

Dim objFSO, objFile, Fpath, Fname, Fline, Pname, lAppData, objShell
Set objShell = CreateObject("WScript.Shell")
lAppData = objShell.ExpandEnvironmentStrings("%APPDATA%")
Fpath= "\Mozilla\Firefox\"
Fname= "profiles.ini"

Set objFSO = CreateObject("Scripting.FileSystemObject")

'open file and create modified file
	Set objFile = objFSO.OpenTextFile(lAppData & Fpath & Fname,1)

	do until objFile.AtEndOfStream
		Fline=objFile.ReadLine
		
		If instr(1,Fline,"=Profiles/")>0 Then	
			Pname= replace(right(Fline,Len(Fline)-5),"/","\")
		End If

	Loop

	ObjFile.Close


objFSO.CopyFile "C:\ZenworksInstalls\cert8.db", lAppData & FPath & PName & "\cert8.db", true