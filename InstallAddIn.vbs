option explicit
on error resume next

dim addInName, xlApp, xlAddin

addInName = "C:\ZenworksInstalls\ExcelAddIns\DATools.xlam"

set xlApp = createObject("excel.application")
xlApp.visible = False
xlApp.workbooks.add
set xlAddin = xlApp.addins.add(addInName,true)
xlAddin.installed = true
xlApp.quit