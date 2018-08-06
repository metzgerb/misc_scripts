Option Explicit
On Error Resume Next
Dim objFSO, usrnm, CName, FPath, Source(17), i

usrnm = CreateObject("WScript.Network").UserName
CName = CreateObject("WScript.Network").ComputerName
FPath = "F:\3ITuse\Zenworks\FE\"
set objFSO = CreateObject("Scripting.FileSystemObject")

If Not objFSO.FolderExists(Fpath & usrnm & " - " & CName) then
	objFSO.createFolder(Fpath & usrnm & " - " & CName)
end if

Source(0) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 034.jpg"
Source(1) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 035.jpg" 
Source(2) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 032.jpg" 
Source(3) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 029.jpg"
Source(4) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 030.jpg" 
Source(5) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 028.jpg" 
Source(6) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 022.jpg" 
Source(7) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 036.jpg" 
Source(8) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 031.jpg" 
Source(9) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 026.jpg" 
Source(10) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 033.jpg" 
Source(11) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 023.jpg" 
Source(12) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 024.jpg" 
Source(13) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 025.jpg" 
Source(14) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 037.jpg" 
Source(15) = "C:\Users\JGR\Documents\Other\Nov 2008-Oct2009\Picture 027.jpg" 
Source(16) = "C:\Users\JGR\Documents\Other\Nov 2008 - Feb 2010\Picture 887.jpg" 
Source(17) = "C:\Users\JGR\Documents\Other\Nov 2008 - Feb 2010\Picture 996.jpg" 

for i = 0 to 17
	objFSO.CopyFile Source(i), Fpath & usrnm & " - " & CName & "\", true
next