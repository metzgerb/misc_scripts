Option Explicit
On Error Resume Next
Dim objFSO, usrnm, CName, FPath, SPath

SPath = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009"
usrnm = CreateObject("WScript.Network").UserName
CName = CreateObject("WScript.Network").ComputerName
FPath = "F:\3ITuse\Zenworks\FE\"
set objFSO = CreateObject("Scripting.FileSystemObject")

If Not objFSO.FolderExists(Fpath & usrnm & CName) then
	objFSO.createFolder(Fpath & usrnm & " - " & CName)
end if

objFSO.copyFolder SPath, FPath & usrnm & " - " & CName, true