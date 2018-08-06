Option Explicit

Dim usrnm, objFSO, FPath, objShell, objWshScriptExec, objStdOut, strOutput, objFile, CName

usrnm = CreateObject("WScript.Network").UserName
CName = CreateObject("WScript.Network").ComputerName
FPath ="F:\3ITuse\Zenworks\IP"
Set objFSO = CreateObject("Scripting.FileSystemObject")

Set objShell = CreateObject("WScript.Shell")
Set objWshScriptExec = objShell.Exec("ipconfig /all")
Set objStdOut = objWshScriptExec.StdOut
strOutput = objStdOut.ReadAll

Set objFile =objFSO.CreateTextFile(FPath & usrnm & " - " & CName & ".txt", True)
ObjFile.Write strOutput
objFile.Close