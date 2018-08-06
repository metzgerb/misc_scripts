Option Explicit
Dim WshShell
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "taskkill /f /im Cscript.exe", , True 
WshShell.Run "taskkill /f /im wscript.exe", , True  