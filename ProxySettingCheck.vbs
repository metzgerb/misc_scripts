Option Explicit
'On Error Resume Next

Dim usrnm, objFSO, objFile, Shl, KeyNum, PEnabled, PNotEnabled

usrnm = CreateObject("WScript.Network").UserName
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set Shl = CreateObject("WScript.Shell")

KeyNum = shl.RegRead("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ProxyEnable")

PEnabled = "F:\3ITuse\Internet Options Check\Proxy\" & usrnm & ".txt"
PNotEnabled = "F:\3ITuse\Internet Options Check\No Proxy\" & usrnm &".txt"

If KeyNum = 1 Then
	
	CheckAndCreateFiles PNotEnabled,PEnabled

Else
	CheckAndCreateFiles PEnabled,PNotEnabled

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
	objFile.Close

End Sub
