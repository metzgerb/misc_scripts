Dim objFSO
On Error Resume Next
set objFSO = CreateObject("Scripting.FileSystemObject")
objFSO.CopyFile "C:\ZenworksInstalls\Logs\elog.txt", "F:\3ITuse\ZenWorks\FE\elog.txt", true