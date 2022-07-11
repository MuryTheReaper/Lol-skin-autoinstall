
set SiteInfo="http://leagueskin.net/p/download-mod-skin-2020-chn"
curl %SiteInfo% > file.txt
FOR /F "tokens=*" %%g IN ('findstr "MODSKIN_" file.txt') do (SET VAR=%%g)
del file.txt
cls

set /p Version="Latest version: %VAR:~64,7% ->"
set DownFolder="C:\Users\usr\Downloads"
set SkinFolder="D:\Skin preview"
set WinRarFolder="C:\Program Files\WinRAR"
set DownSite="http://s4.modskinlolvn.com/MODSKIN_%Version%.zip"

curl %DownSite% --output "%DownFolder%\MODSKIN.rar"
cd %WinRarFolder%
winrar e -y "%DownFolder%\MODSKIN.rar" %SkinFolder%
del "%DownFolder%\MODSKIN.rar"
%SkinFolder:~0,2%
cd %SkinFolder%
"LOLPRO %Version%.exe"


