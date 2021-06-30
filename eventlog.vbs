Dim objFSO, objFile, FPath, usr, acctnm, DateToCheck, DateFromCheck
On Error Resume Next

usr= "tdf"
DateFromCheck = CDate("03/01/2020")
DateToCheck = CDate("03/05/2020")

FPath="C:\OAG-IT\"
set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile =objFSO.CreateTextFile(FPath & "elog.txt", True)
Set dtmStartDate = CreateObject("WbemScripting.SWbemDateTime")
Set dtmEndDate = CreateObject("WbemScripting.SWbemDateTime")

dtmStartDate.SetVarDate DateFromCheck, CONVERT_TO_LOCAL_TIME
dtmEndDate.SetVarDate DateToCheck +1, CONVERT_TO_LOCAL_TIME

strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" _
    & strComputer & "\root\cimv2")
Set colLoggedEvents = objWMIService.ExecQuery _
    ("Select * from Win32_NTLogEvent " _
        & "Where Logfile = 'Security' AND TimeWritten >= '" _ 
        & dtmStartDate & "' AND TimeWritten < '" & dtmEndDate & "' AND ((EventIdentifier = 4624 AND Message LIKE '%" & usr & "%') OR (EventIdentifier = 4634 AND Message LIKE '%" & usr & "%') OR (EventIdentifier = 4608))" )

For Each objEvent in colLoggedEvents
    'objFile.write objEvent.Category & VBTab & objEvent.ComputerName & VBTab & objEvent.EventCode & VBTab & left(objEvent.Message,Instr(1,objEvent.Message,vbCrLf,0)) & VBTab & objEvent.RecordNumber & VBTab & objEvent.TimeWritten & VBTab & objEvent.Type & VBTab & objEvent.User & vbCrLf
	acctnm = ""
	if Instrrev(objEvent.Message,"Account Name:")<>0 then
		acctnm = replace(Mid(objEvent.Message,Instrrev(objEvent.Message,"Account Name:"), Instr(Instrrev(objEvent.Message,"Account Name:"), objEvent.Message, vbCrLf)-Instrrev(objEvent.Message,"Account Name:")),"Account Name:		","" )
	end if
	
	objFile.write objEvent.ComputerName & VBTab & objEvent.EventCode & VBTab & left(objEvent.Message,Instr(1,objEvent.Message,vbCrLf,0)-1) & VBTab & acctnm & VBTab & objEvent.TimeWritten & vbCrLf
Next

objFile.close