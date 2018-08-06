Option Explicit
'On Error Resume Next

Dim usrnm, objFSO, objFile, Shl, VNum, UVNum, Has11, Not11

usrnm = CreateObject("WScript.Network").UserName
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set Shl = CreateObject("WScript.Shell")

VNum = shl.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\svcVersion")
UVNum = shl.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\svcUpdateVersion")
	
Has11 = "F:\3ITuse\IEVersionCheck\Has Version 11\" & usrnm & " " & VNum & " " & UVNum & ".txt"
Not11 = "F:\3ITuse\IEVersionCheck\Does Not Have Version 11\" & usrnm & " " & VNum & " " & UVNum  & ".txt"



If Left(VNum,2) = 11 Then
	
	CheckAndCreateFiles Not11,Has11

Else
	CheckAndCreateFiles Has11,Not11

End If

'********************************************
'Subroutine to check for and create txt files
'********************************************

Sub CheckAndCreateFiles (FileName1, FileName2)

	
	'Check for file in first folder and delete
	If objFSO.FileExists(FileName1) then
			
		objFSO.DeleteFile(FileName1)
	
	End If

	'Overwrite file in second folder
	Set objFile =objFSO.CreateTextFile(FileName2, True)
	'ObjFile.Write "Version Number: " & Vnum & vbCrLf & "Update Version: " & UVNum
	objFile.Close

End Sub
