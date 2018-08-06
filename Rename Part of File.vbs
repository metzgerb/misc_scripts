Option Explicit
On Error Resume Next

Dim objFSO, objFolder, objFile, FolderPath, File, oName, SearchText, ReplaceText, nName

Set objFSO = CreateObject("Scripting.FileSystemObject")

FolderPath =Inputbox("Folder Path:")
SearchText = Inputbox("Text to search for:")
ReplaceText = Inputbox("Text to insert:")

Set objFolder = objFSO.GetFolder(FolderPath)
Set objFile = objFolder.Files
	
For Each File in objFile
	oName=File.Name	
	If Instr(oName, SearchText)<>0 Then
		nName=Replace(oName,SearchText, ReplaceText,1,-1,vbTextCompare)	
		File.Name = nName
	End If

Next

msgbox "Complete"