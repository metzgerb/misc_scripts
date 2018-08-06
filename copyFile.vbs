Dim objFSO
On Error Resume Next
set objFSO = CreateObject("Scripting.FileSystemObject")
objFSO.CopyFile "C:\ZenworksInstalls\FindHistory.txt", "F:\3ITuse\ZenWorks\FE\FindHistory.txt", true