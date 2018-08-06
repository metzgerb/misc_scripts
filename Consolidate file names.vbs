Option Explicit
On Error Resume Next

Dim objFSO, objFolder, objFile, FilePath, dirFile, File, parts

Set objFSO = CreateObject("Scripting.FileSystemObject")

dirtxt "F:\3NM\Installed"
dirtxt "F:\3NM\Not Installed"


'*************
'Subroutine
'*************

Sub dirtxt (FolderPath)

FilePath = FolderPath & ".txt"

Set DirFile = objFSO.OpenTextFile(FilePath, 2, True)

Set objFolder = objFSO.GetFolder(FolderPath)

Set objFile = objFolder.Files
	
For Each File in objFile

    	parts=replace(File.Name, ".txt", "")
	parts= split(parts, " ")
	DirFile.writeline(parts(0))

Next

Dirfile.close

End Sub