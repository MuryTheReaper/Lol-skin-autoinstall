
set SiteInfo="http://leagueskin.net/p/download-mod-skin-2020-chn"
curl %SiteInfo% > file.txt
FOR /F "tokens=*" %%g IN ('findstr "MODSKIN_" file.txt') do (SET VAR=%%g)
del file.txt
cls

set /p Version="Latest version: %VAR:~64,7% ->"
set DownFolder="C:\Users\murya\Downloads"
set SkinFolder="D:\Skin preview"
set ZipFolder="C:\Program Files\7-Zip"
set DownSite="http://s4.modskinlolvn.com/MODSKIN_%Version%.zip"


%DownFolder:~1,2%
curl %DownSite% --output %DownFolder%\MODSKIN.rar
cd %ZipFolder%
7z x -y %DownFolder%\MODSKIN.rar -o%SkinFolder%
del %DownFolder%\MODSKIN.rar
%SkinFolder:~1,2%
cd %SkinFolder%
"LOLPRO %Version%.exe"


