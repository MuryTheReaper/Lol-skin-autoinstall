
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

%DownFolder:~1,2%
curl %DownSite% --output %DownFolder%\MODSKIN.rar
cd %DownFolder%
mkdir Temp
cd %WinRarFolder%
winrar e -y %DownFolder%\MODSKIN.rar %DownFolder%\Temp
del %DownFolder%\MODSKIN.rar
xcopy %DownFolder%\Temp\ %SkinFolder% /y
del %DownFolder%\Temp /q
rmdir %DownFolder%\Temp /q
%SkinFolder:~1,2%
rmdir %SkinFolder%\Temp /q
cd %SkinFolder%
"LOLPRO %Version%.exe"


