Const ForReading = 1 
Const ForWriting = 2 

Set objFSO = CreateObject("Scripting.FileSystemObject") 
Fpath = inputbox("provide path:")
Fname = inputbox("Provide file name:") 
Set objFile = objFSO.OpenTextFile(Fpath & "\" & fname & ".txt", ForReading) 

strText = objFile.ReadAll 
objFile.Close 

InputText = array("1120","1140","1145","1165","1170","1175","1202","1205","1214","1221","1223","1224","1225","1229","1230","1231","1232","1233","1234","1236","1239","1240","1245","1246","1248","1251","1252","1253","1255","1261","1263","1264","1274","1275","1277","1279","1284","1285","1286","1289","1291","1293","1294","1295","1296","1302","1304","1308","1310","1335","1345","1350","1360","1370","1391","1392","1394","1395","1397","1398","1399","1510","1521","1530","1540","1560","1599","1685","1687","1710","1721","1722","1723","1728","1729","1730","1740","1750","1893","1894","1896","1898","1899","1991","4411","4428","4429","4459","9934")
'InputText = Inputbox("Text to insert Tab after:")
for i = 0 to ubound(InputText)

strNewText = Replace(strText, InputText(i), InputText(i) & vbTab)

next 

Set objFile = objFSO.OpenTextFile(Fpath & "\" & fname & ".txt", ForWriting) 
objFile.WriteLine strNewText 
objFile.Close

msgbox "Complete"