Const ForReading = 1 
Const ForWriting = 2 

Set objFSO = CreateObject("Scripting.FileSystemObject")
Fpath = inputbox("provide path:")
Fname = inputbox("Provide file name:")
Set objFile = objFSO.OpenTextFile(Fpath & "\" & fname & ".txt", ForReading) 

strText = objFile.ReadAll 
objFile.Close 
strNewText = Replace(strText, chr(013) & chr(010), "") 'chr(010) = line feed chr(013) = carriage return 

Set objFile = objFSO.OpenTextFile(Fpath & "\" & fname & ".txt", ForWriting) 
objFile.WriteLine strNewText 
objFile.Close

msgbox "Complete"