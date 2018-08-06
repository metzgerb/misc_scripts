Const ForReading = 1 
Const ForWriting = 2 

Dim FPath, FName, StrText, InputText, ReplaceText, StrNewText
'Fpath = Inputbox("File Path:")
'FName = Inputbox("File Name:")

Set objFSO = CreateObject("Scripting.FileSystemObject") 
'Set objFile = objFSO.OpenTextFile(Fpath & "\" & FName & ".txt", ForReading) 
Set objFile = objFSO.OpenTextFile("C:\Users\bdm.oag-9276\Desktop\FCIAA.txt", ForReading) 

strText = objFile.ReadAll 
objFile.Close 

InputText = Inputbox("Text to Remove:")
ReplaceText = Inputbox("Replacement Text:")

strNewText = Replace(strText, InputText, ReplaceText)

'Set objFile = objFSO.OpenTextFile(Fpath & "\" & FName & ".txt", ForWriting)
Set objFile = objFSO.OpenTextFile("C:\Users\bdm.oag-9276\Desktop\FCIAA.txt", ForWriting)  
objFile.WriteLine strNewText 
objFile.Close
msgbox "Complete"