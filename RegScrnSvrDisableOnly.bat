@echo off
Reg Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v NoDispScrSavPage /d "1" /t Reg_SZ /f
