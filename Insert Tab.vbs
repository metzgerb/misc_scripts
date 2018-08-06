Const ForReading = 1 
Const ForWriting = 2 

Set objFSO = CreateObject("Scripting.FileSystemObject") 
Fpath = inputbox("provide path:")
Fname = inputbox("Provide file name:") 
Set objFile = objFSO.OpenTextFile(Fpath & "\" & fname & ".txt", ForReading) 

strText = objFile.ReadAll 
objFile.Close 

InputText = Inputbox("Text to insert Tab after:")

strNewText = Replace(strText, InputText, InputText & vbTab)

Set objFile = objFSO.OpenTextFile(Fpath & "\" & fname & ".txt", ForWriting) 
objFile.WriteLine strNewText 
objFile.Close

msgbox "Complete"