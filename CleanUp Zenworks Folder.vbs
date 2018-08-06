Option Explicit
On error Resume Next

dim objFSO

Set objFSO = CreateObject("Scripting.FileSystemObject")

'delete files
objFSO.DeleteFile("C:\ZenworksInstalls\*.txt"),True
objFSO.DeleteFile("C:\ZenworksInstalls\*.exe"),True

objFSO.DeleteFile("C:\ZenworksInstalls\McAfeeUninstall.bat"),True
objFSO.DeleteFile("C:\ZenworksInstalls\KMS.bat"),True