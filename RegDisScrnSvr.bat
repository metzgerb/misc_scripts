@echo off
Reg Add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaveActive /d "1" /t Reg_SZ /f
Reg Add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaveTimeOut /d "600" /t Reg_SZ /f
Reg Add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaverIsSecure /d "1" /t Reg_SZ /f
Reg Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v NoDispScrSavPage /d "1" /t Reg_SZ /f
