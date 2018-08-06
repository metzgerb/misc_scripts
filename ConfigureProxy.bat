Reg Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v MigrateProxy /d "1" /t REG_DWORD /f
Reg Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /d "1" /t REG_DWORD /f
Reg Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyHttp1.1 /d "0" /t REG_DWORD /f
Reg Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "10.18.3.170:8080" /t REG_SZ /f
Reg Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /d "https://zcm11.auditor.internal;<local>" /t REG_SZ /f