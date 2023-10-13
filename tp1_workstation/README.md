# Compte rendu TP1_WorkStation

# I. Self-footprinting

## 1. Host OS

#### Système + os

```
hostname
MSI-9SEXR
```

```
C:\Users\yrlan\GitWork\project-1> systeminfo
[...]
Type du système: x64-based PC
[...]
```

```
(Get-WmiObject Win32_OperatingSystem).Version
Version du système : 10.0.19042

(Get-WmiObject -class Win32_OperatingSystem).Caption
Nom du système d’exploitation : Microsoft Windows 10 Professionnel
```

#### Quantité + Modèle de la Mémoire vive
```
wmic memorychip get Capacity
Capacity
8589934592
8589934592

wmic memorychip get PartNumber
PartNumber
M471A1K43CB1-CTD
M471A1K43CB1-CTD
````

## 2. Devices

#### Processeur
````
Get-CimInstance -ClassName Win32_Processor | Select-Object -ExcludeProperty "CIM*"
Name : Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
````
I3;I5;I7 correspondent à la gamme du processeur, le 9(premiers chiffre) est un indicateur sur l'architecture/génération du processeur
Le H signifie que c'est un processeur à haute performances optimisées pour les plateformes mobiles.
Les chiffres entre le 9 et le H composent le numéro SKU, qui est un peu leur désignation commerciale, **en général**, plus il est élevé, plus le processeur est puissant mais c'est surtout valable pour des processeurs de même gamme et de même génération.
````
WMIC CPU Get DeviceID,NumberOfCores,NumberOfLogicalProcessors
NumberOfCores : 4 
NumberOfLogicalProcessors : 8 
````

#### Carte Graphique
````
wmic path win32_VideoController get name
Name
"Intel(R) UHD Graphics 630" qui est la Carte graphique intégrée au processeur
"NVIDIA GeForce RTX 2060" qui est la CG Dédiée externe
``````

#### Disque dur
```
diskpart
select disk 0
detail disk
Marque + Modèle : SAMSUNG MZVLQ512HALU-00000
[...]
Volume 0 - NTFS 
Volume 1 - FAT32
[...]
````
La partition 0 est la partition où sont stockées toutes les données, elle est formatée en NTFS.
La partition 1 est la partition système où sont les données nécessaires à Windows, elle est formatée en FAT32.


## 3. Users
````
wmic useraccount list full

AccountType=512
Description=Compte d'utilisateur d'administration
Disabled=TRUE
Domain=MSI-9SEXR
FullName=
InstallDate=
LocalAccount=TRUE
Lockout=FALSE
Name=Administrateur
PasswordChangeable=TRUE
PasswordExpires=FALSE
PasswordRequired=TRUE
SID=S-1-5-21-1968258186-1579205017-2869952045-500
SIDType=1
Status=Degraded


AccountType=512
Description=Compte utilisateur géré par le système.
Disabled=TRUE
Domain=MSI-9SEXR
FullName=
InstallDate=
LocalAccount=TRUE
Lockout=FALSE
Name=DefaultAccount
PasswordChangeable=TRUE
PasswordExpires=FALSE
PasswordRequired=FALSE
SID=S-1-5-21-1968258186-1579205017-2869952045-503
SIDType=1
Status=Degraded


AccountType=512
Description=Compte d'utilisateur invité
Disabled=TRUE
Domain=MSI-9SEXR
FullName=
InstallDate=
LocalAccount=TRUE
Lockout=FALSE
Name=Invité
PasswordChangeable=FALSE
PasswordExpires=FALSE
PasswordRequired=FALSE
SID=S-1-5-21-1968258186-1579205017-2869952045-501
SIDType=1
Status=Degraded


AccountType=512
Description=Compte d'utilisateur géré et utilisé par le système pour les scénarios Windows Defender Application Guard.
Disabled=TRUE
Domain=MSI-9SEXR
FullName=
InstallDate=
LocalAccount=TRUE
Lockout=FALSE
Name=WDAGUtilityAccount
PasswordChangeable=TRUE
PasswordExpires=TRUE
PasswordRequired=TRUE
SID=S-1-5-21-1968258186-1579205017-2869952045-504
SIDType=1
Status=Degraded


AccountType=512
Description=
Disabled=FALSE
Domain=MSI-9SEXR
FullName=Yrlan Montagnier
InstallDate=
LocalAccount=TRUE
Lockout=FALSE
Name=yrlan
PasswordChangeable=TRUE
PasswordExpires=FALSE
PasswordRequired=TRUE
SID=S-1-5-21-1968258186-1579205017-2869952045-1001
SIDType=1
Status=OK
````
L'utilisateur qui a toutes les permissions sur la machine est le "Compte d'utilisateur d'administration" car le SID S-1-5-21[...]-500 correspond à un controle total de la machine par défaut.

## 4. Processus
Lister tous les processus en cours avec leur description + ID du process: 
````
wmic process get description,processid,parentprocessid,commandline /format:csv
MSI-9SEXR,,System Idle Process,0,0
MSI-9SEXR,,System,0,4
MSI-9SEXR,,Secure System,4,72
MSI-9SEXR,,Registry,4,132
MSI-9SEXR,,smss.exe,4,504
MSI-9SEXR,,csrss.exe,612,736
MSI-9SEXR,,wininit.exe,612,960
MSI-9SEXR,,csrss.exe,952,972
MSI-9SEXR,,services.exe,960,760
MSI-9SEXR,,LsaIso.exe,960,780
MSI-9SEXR,,lsass.exe,960,788
MSI-9SEXR,,svchost.exe,760,916
MSI-9SEXR,,svchost.exe,760,612
MSI-9SEXR,,fontdrvhost.exe,960,864
MSI-9SEXR,,svchost.exe,760,1064
MSI-9SEXR,,svchost.exe,760,1112
MSI-9SEXR,,winlogon.exe,952,1168
MSI-9SEXR,,fontdrvhost.exe,1168,1216
MSI-9SEXR,,dwm.exe,1168,1296
MSI-9SEXR,,svchost.exe,760,1376
MSI-9SEXR,,svchost.exe,760,1444
MSI-9SEXR,,svchost.exe,760,1452
MSI-9SEXR,,svchost.exe,760,1512
MSI-9SEXR,,IntelCpHDCPSvc.exe,760,1568
MSI-9SEXR,,svchost.exe,760,1576
MSI-9SEXR,,svchost.exe,760,1584
MSI-9SEXR,,svchost.exe,760,1644
MSI-9SEXR,,svchost.exe,760,1736
MSI-9SEXR,,svchost.exe,760,1796
MSI-9SEXR,,IntelCpHeciSvc.exe,760,1848
MSI-9SEXR,,svchost.exe,760,1864
MSI-9SEXR,,igfxCUIService.exe,760,2036
MSI-9SEXR,,svchost.exe,760,1384
MSI-9SEXR,,svchost.exe,760,2108
MSI-9SEXR,,NVDisplay.Container.exe,760,2164
MSI-9SEXR,,svchost.exe,760,2176
MSI-9SEXR,,svchost.exe,760,2272
MSI-9SEXR,,svchost.exe,760,2320
MSI-9SEXR,,svchost.exe,760,2380
MSI-9SEXR,,svchost.exe,760,2388
MSI-9SEXR,,svchost.exe,760,2396
MSI-9SEXR,,svchost.exe,760,2480
MSI-9SEXR,,svchost.exe,760,2488
MSI-9SEXR,,Memory Compression,4,2516
MSI-9SEXR,,svchost.exe,760,2508
MSI-9SEXR,,svchost.exe,760,2708
MSI-9SEXR,,svchost.exe,760,2724
MSI-9SEXR,,svchost.exe,760,2796
MSI-9SEXR,,svchost.exe,760,2836
MSI-9SEXR,,svchost.exe,760,2920
MSI-9SEXR,,NVDisplay.Container.exe,2164,2992
MSI-9SEXR,,svchost.exe,760,3068
MSI-9SEXR,,svchost.exe,760,2968
MSI-9SEXR,,svchost.exe,760,3200
MSI-9SEXR,,svchost.exe,760,3208
MSI-9SEXR,,svchost.exe,760,3220
MSI-9SEXR,,svchost.exe,760,3232
MSI-9SEXR,C:\Windows\system32\svchost.exe -k UnistackSvcGroup -s CDPUserSvc,svchost.exe,760,3332
MSI-9SEXR,sihost.exe,sihost.exe,1796,3344
MSI-9SEXR,C:\Windows\system32\svchost.exe -k UnistackSvcGroup -s WpnUserService,svchost.exe,760,3412
MSI-9SEXR,,PresentationFontCache.exe,760,3420
MSI-9SEXR,,svchost.exe,760,3440
MSI-9SEXR,,svchost.exe,760,3448
MSI-9SEXR,taskhostw.exe {222A245B-E637-4AE9-A93F-A59CA119A75E},taskhostw.exe,1512,3628
MSI-9SEXR,,svchost.exe,760,4012
MSI-9SEXR,,svchost.exe,760,1276
MSI-9SEXR,,svchost.exe,760,3908
MSI-9SEXR,,ctfmon.exe,1276,4128
MSI-9SEXR,,svchost.exe,760,4220
MSI-9SEXR,,spoolsv.exe,760,4364
MSI-9SEXR,,svchost.exe,760,4440
MSI-9SEXR,,svchost.exe,760,4508
MSI-9SEXR,,svchost.exe,760,4516
MSI-9SEXR,,svchost.exe,760,4524
MSI-9SEXR,,svchost.exe,760,4532
MSI-9SEXR,,svchost.exe,760,4540
MSI-9SEXR,,jhi_service.exe,760,4608
MSI-9SEXR,,OneApp.IGCC.WinService.exe,760,4616
MSI-9SEXR,,armsvc.exe,760,4640
MSI-9SEXR,,OfficeClickToRun.exe,760,4676
MSI-9SEXR,,AGSService.exe,760,4688
MSI-9SEXR,,AGMService.exe,760,4732
MSI-9SEXR,,MSIAPService.exe,760,4788
MSI-9SEXR,,MSIService.exe,760,4796
MSI-9SEXR,,NahimicService.exe,760,4832
MSI-9SEXR,,MSI_Companion_Service.exe,760,4840
MSI-9SEXR,,MSI_Central_Service.exe,760,4848
MSI-9SEXR,,svchost.exe,760,4904
MSI-9SEXR,,RtkAudUService64.exe,760,4920
MSI-9SEXR,,svchost.exe,760,4928
MSI-9SEXR,,svchost.exe,760,4936
MSI-9SEXR,,Sendevsvc.exe,760,4944
MSI-9SEXR,,svchost.exe,760,4952
MSI-9SEXR,,svchost.exe,760,4964
MSI-9SEXR,,nvcontainer.exe,760,4980
MSI-9SEXR,,VoiceControl_Service.exe,760,5000
MSI-9SEXR,,MsMpEng.exe,760,5040
MSI-9SEXR,,svchost.exe,760,1424
MSI-9SEXR,,svchost.exe,760,5164
MSI-9SEXR,,dasHost.exe,4540,5200
MSI-9SEXR,,WmiPrvSE.exe,612,5324
MSI-9SEXR,,svchost.exe,760,5504
MSI-9SEXR,,wlanext.exe,4012,6060
MSI-9SEXR,,unsecapp.exe,612,6072
MSI-9SEXR,,conhost.exe,6060,6088
MSI-9SEXR,"C:\Windows\System32\DriverStore\FileRepository\cui_dch.inf_amd64_b8e01d9e8716d2a7\igfxEM.exe",igfxEM.exe,2036,6348
MSI-9SEXR,,WmiPrvSE.exe,612,6512
MSI-9SEXR,,rundll32.exe,4980,6800
MSI-9SEXR,C:\Windows\Explorer.EXE,explorer.exe,6108,4756
MSI-9SEXR,,SearchIndexer.exe,760,3552
MSI-9SEXR,,svchost.exe,760,7180
MSI-9SEXR,"C:\Program Files\NVIDIA Corporation\NvContainer\nvcontainer.exe" -f "C:\ProgramData\NVIDIA\NvContainerUser%d.log" -d "C:\Program Files\NVIDIA Corporation\NvContainer\plugins\User" -r -l 3 -p 30000 -st "C:\Program Files\NVIDIA Corporation\NvContainer\NvContainerTelemetryApi.dll" -c,nvcontainer.exe,4980,7424
MSI-9SEXR,C:\Windows\system32\svchost.exe -k ClipboardSvcGroup -p -s cbdhsvc,svchost.exe,760,7468
MSI-9SEXR,,MSI.CentralServer.exe,4848,7712
MSI-9SEXR,,svchost.exe,760,7728
MSI-9SEXR,,svchost.exe,760,7740
MSI-9SEXR,,conhost.exe,7712,7944
MSI-9SEXR,,svchost.exe,760,7540
MSI-9SEXR,,svchost.exe,760,8252
MSI-9SEXR,,VoiceControlEngine.exe,1512,8260
MSI-9SEXR,,svchost.exe,760,8412
MSI-9SEXR,"C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe" -ServerName:App.AppXywbrabmsek0gm3tkwpr5kwzbs55tkqay.mca,StartMenuExperienceHost.exe,612,8724
MSI-9SEXR,,NisSrv.exe,760,8952
MSI-9SEXR,C:\Windows\System32\RuntimeBroker.exe -Embedding,RuntimeBroker.exe,612,9052
MSI-9SEXR,"C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy\SearchApp.exe" -ServerName:CortanaUI.AppX8z9r6jm96hw4bsbneegw0kyxx296wr9t.mca,SearchApp.exe,612,9116
MSI-9SEXR,C:\Windows\System32\RuntimeBroker.exe -Embedding,RuntimeBroker.exe,612,9640
MSI-9SEXR,,svchost.exe,760,9740
MSI-9SEXR,C:\Windows\system32\SettingSyncHost.exe -Embedding,SettingSyncHost.exe,612,9836
MSI-9SEXR,"C:\Windows\SystemApps\Microsoft.LockApp_cw5n1h2txyewy\LockApp.exe" -ServerName:WindowsDefaultLockScreen.AppX7y4nbzq37zn4ks9k7amqjywdat7d3j2z.mca,LockApp.exe,612,10328
MSI-9SEXR,C:\Windows\System32\RuntimeBroker.exe -Embedding,RuntimeBroker.exe,612,10552
MSI-9SEXR,C:\Windows\System32\RuntimeBroker.exe -Embedding,RuntimeBroker.exe,612,10588
MSI-9SEXR,,svchost.exe,760,11104
MSI-9SEXR,"C:\Program Files (x86)\NVIDIA Corporation\NvNode\NVIDIA Web Helper.exe" index.js,NVIDIA Web Helper.exe,3672,11208
MSI-9SEXR,\??\C:\Windows\system32\conhost.exe 0x4,conhost.exe,11208,11220
MSI-9SEXR,,svchost.exe,760,9912
MSI-9SEXR,,dllhost.exe,612,6856
MSI-9SEXR,,svchost.exe,760,11684
MSI-9SEXR,,svchost.exe,760,11724
MSI-9SEXR,,NahimicSvc64.exe,1512,11420
MSI-9SEXR,,NahimicSvc32.exe,1512,11388
MSI-9SEXR,"C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\InputApp\TextInputHost.exe" -ServerName:InputApp.AppX9jnwykgrccxc8by3hsrsh07r423xzvav.mca,TextInputHost.exe,612,11524
MSI-9SEXR,"C:\Windows\System32\SecurityHealthSystray.exe" ,SecurityHealthSystray.exe,4756,1992
MSI-9SEXR,,SecurityHealthService.exe,760,8112
MSI-9SEXR,"C:\Windows\System32\RtkAudUService64.exe" -background,RtkAudUService64.exe,4756,11944
MSI-9SEXR,C:\Windows\System32\RuntimeBroker.exe -Embedding,RuntimeBroker.exe,612,11964
MSI-9SEXR,"C:\Program Files\WindowsApps\Microsoft.YourPhone_1.20092.108.0_x64__8wekyb3d8bbwe\YourPhoneServer/YourPhoneServer.exe" -Embedding,YourPhoneServer.exe,612,10092
MSI-9SEXR,C:\Windows\System32\svchost.exe -k UnistackSvcGroup,svchost.exe,760,2632
MSI-9SEXR,,svchost.exe,760,6916
MSI-9SEXR,C:\Windows\system32\DllHost.exe /Processid:{973D20D7-562D-44B9-B70B-5A0F49CCDF3F},dllhost.exe,612,8352
MSI-9SEXR,"C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\ShellExperienceHost.exe" -ServerName:App.AppXtk181tbxbce2qsex02s8tw7hfxa9xb3t.mca,ShellExperienceHost.exe,612,10984
MSI-9SEXR,C:\Windows\System32\RuntimeBroker.exe -Embedding,RuntimeBroker.exe,612,1488
MSI-9SEXR,,Dragon Center.exe,1512,5292
MSI-9SEXR,C:\Windows\system32\ApplicationFrameHost.exe -Embedding,ApplicationFrameHost.exe,612,9064
MSI-9SEXR,"C:\Program Files\WindowsApps\Microsoft.WindowsStore_12009.1001.1.0_x64__8wekyb3d8bbwe\WinStore.App.exe" -ServerName:App.AppXc75wvwned5vhz4xyxxecvgdjhdkgsdza.mca,WinStore.App.exe,612,11516
MSI-9SEXR,C:\Windows\System32\RuntimeBroker.exe -Embedding,RuntimeBroker.exe,612,11560
MSI-9SEXR,"C:\Program Files\WindowsApps\AppUp.IntelGraphicsExperience_1.100.2765.0_x64__8j3eq9eme6ctt\IGCC.exe" -ServerName:App.AppXxq4ar3drev924dxqnatpa4s48c4zrxd1.mca,IGCC.exe,612,8584
MSI-9SEXR,,svchost.exe,760,5032
MSI-9SEXR,,SgrmBroker.exe,760,3768
MSI-9SEXR,,svchost.exe,760,7188
MSI-9SEXR,,svchost.exe,760,12332
MSI-9SEXR,,MoUsoCoreWorker.exe,612,3656
MSI-9SEXR,,svchost.exe,760,1480
MSI-9SEXR,,svchost.exe,760,11628
MSI-9SEXR,"C:\Program Files\WindowsApps\microsoft.windowscommunicationsapps_16005.13228.41011.0_x64__8wekyb3d8bbwe\commsapps.exe" -ServerName:microsoft.windowslive.calendar.AppXaxryfc9wnz995r6nkwyhf0ysk0m3xeg2.mca,commsapps.exe,612,7576
MSI-9SEXR,"C:\Program Files\WindowsApps\microsoft.windowscommunicationsapps_16005.13228.41011.0_x64__8wekyb3d8bbwe\HxTsr.exe" -ServerName:Hx.IPC.Server,HxTsr.exe,612,10824
MSI-9SEXR,"C:\Users\yrlan\AppData\Local\Discord\app-0.0.308\Discord.exe" ,Discord.exe,7036,6548
MSI-9SEXR,"C:\Users\yrlan\AppData\Local\Discord\app-0.0.308\Discord.exe" --type=gpu-process --field-trial-handle=1796,4024255349690073668,6100047388159379697,131072 --disable-features=SpareRendererForSitePerProcess --gpu-preferences=KAAAAAAAAADgAAAwAAAAAAAAYAAAAAAAEAAAAAAAAAAAAAAAAAAAACgAAAAEAAAAIAAAAAAAAAAoAAAAAAAAADAAAAAAAAAAOAAAAAAAAAAQAAAAAAAAAAAAAAAFAAAAEAAAAAAAAAAAAAAABgAAABAAAAAAAAAAAQAAAAUAAAAQAAAAAAAAAAEAAAAGAAAA --service-request-channel-token=13385104904871662304 --mojo-platform-channel-handle=1800 --ignored=" --type=renderer " /prefetch:2,Discord.exe,6548,9896
MSI-9SEXR,"C:\Users\yrlan\AppData\Local\Discord\app-0.0.308\Discord.exe" --type=utility --field-trial-handle=1796,4024255349690073668,6100047388159379697,131072 --disable-features=SpareRendererForSitePerProcess --lang=fr --service-sandbox-type=network --service-request-channel-token=6470377480551582515 --mojo-platform-channel-handle=2260 /prefetch:8,Discord.exe,6548,2144
MSI-9SEXR,C:\Users\yrlan\AppData\Local\Discord\app-0.0.308\Discord.exe --no-rate-limit --no-upload-gzip --type=crash-handler "--crashes-directory=C:\Users\yrlan\AppData\Local\Temp\Discord Crashes" "--database=C:\Users\yrlan\AppData\Local\Temp\Discord Crashes" "--metrics-dir=C:\Users\yrlan\AppData\Local\Temp\Discord Crashes" --url=https://sentry.io/api/146342/minidump/?sentry_key=384ce4413de74fe0be270abe03b2b35a --initial-client-data=0xa58,0x9f0,0xa5c,0xa50,0x9a8,0x5fbf090,0x5fbf0a0,0x5fbf0ac,Discord.exe,6548,1536
MSI-9SEXR,"C:\Users\yrlan\AppData\Local\Discord\app-0.0.308\Discord.exe" --type=renderer --autoplay-policy=no-user-gesture-required --field-trial-handle=1796,4024255349690073668,6100047388159379697,131072 --disable-features=SpareRendererForSitePerProcess --lang=fr --app-user-model-id=com.squirrel.Discord.Discord --app-path="C:\Users\yrlan\AppData\Local\Discord\app-0.0.308\resources\app.asar" --no-sandbox --no-zygote --native-window-open --preload="C:\Users\yrlan\AppData\Roaming\discord\0.0.308\modules\discord_desktop_core\core.asar\app\mainScreenPreload.js" --disable-remote-module --context-isolation --background-color=#202225 --enable-websql --device-scale-factor=1.25 --num-raster-threads=4 --enable-main-frame-before-activation --service-request-channel-token=2319092676291836476 --renderer-client-id=7 --no-v8-untrusted-code-mitigations --mojo-platform-channel-handle=2732 /prefetch:1 --enable-node-leakage-in-renderers,Discord.exe,6548,7920
MSI-9SEXR,"C:\Users\yrlan\AppData\Local\Discord\app-0.0.308\Discord.exe" --type=utility --field-trial-handle=1796,4024255349690073668,6100047388159379697,131072 --disable-features=SpareRendererForSitePerProcess --lang=fr --service-sandbox-type=audio --service-request-channel-token=3450423864542854343 --mojo-platform-channel-handle=2708 /prefetch:8,Discord.exe,6548,3776
MSI-9SEXR,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -- "https://gitlab.com/it4lik/b1-workstation/",chrome.exe,6548,2156
MSI-9SEXR,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --type=crashpad-handler "--user-data-dir=C:\Users\yrlan\AppData\Local\Google\Chrome\User Data" /prefetch:7 --monitor-self-annotation=ptype=crashpad-handler "--database=C:\Users\yrlan\AppData\Local\Google\Chrome\User Data\Crashpad" "--metrics-dir=C:\Users\yrlan\AppData\Local\Google\Chrome\User Data" --url=https://clients2.google.com/cr/report --annotation=channel= --annotation=plat=Win64 --annotation=prod=Chrome --annotation=ver=85.0.4183.121 --initial-client-data=0xe8,0xec,0xf0,0xc4,0xf4,0x7ff98b7c3e00,0x7ff98b7c3e10,0x7ff98b7c3e20,chrome.exe,2156,8648
MSI-9SEXR,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --type=gpu-process --field-trial-handle=1628,8223917166689525299,12993788025602838451,131072 --gpu-preferences=MAAAAAAAAADgAAAwAAAAAAAAAAAAAAAAAABgAAAAAAAQAAAAAAAAAAAAAAAAAAAAKAAAAAQAAAAgAAAAAAAAACgAAAAAAAAAMAAAAAAAAAA4AAAAAAAAABAAAAAAAAAAAAAAAAUAAAAQAAAAAAAAAAAAAAAGAAAAEAAAAAAAAAABAAAABQAAABAAAAAAAAAAAQAAAAYAAAA= --mojo-platform-channel-handle=1580 /prefetch:2,chrome.exe,2156,12756
MSI-9SEXR,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --type=utility --utility-sub-type=network.mojom.NetworkService --field-trial-handle=1628,8223917166689525299,12993788025602838451,131072 --lang=fr --service-sandbox-type=network --enable-audio-service-sandbox --mojo-platform-channel-handle=2092 /prefetch:8,chrome.exe,2156,10908
MSI-9SEXR,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --type=utility --utility-sub-type=storage.mojom.StorageService --field-trial-handle=1628,8223917166689525299,12993788025602838451,131072 --lang=fr --service-sandbox-type=none --enable-audio-service-sandbox --mojo-platform-channel-handle=2208 /prefetch:8,chrome.exe,2156,3320
MSI-9SEXR,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --type=renderer --field-trial-handle=1628,8223917166689525299,12993788025602838451,131072 --lang=fr --extension-process --enable-auto-reload --device-scale-factor=1.25 --num-raster-threads=4 --enable-main-frame-before-activation --renderer-client-id=5 --no-v8-untrusted-code-mitigations --mojo-platform-channel-handle=3440 /prefetch:1,chrome.exe,2156,12452
MSI-9SEXR,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --type=renderer --field-trial-handle=1628,8223917166689525299,12993788025602838451,131072 --lang=fr --extension-process --enable-auto-reload --device-scale-factor=1.25 --num-raster-threads=4 --enable-main-frame-before-activation --renderer-client-id=6 --no-v8-untrusted-code-mitigations --mojo-platform-channel-handle=3588 /prefetch:1,chrome.exe,2156,3756
MSI-9SEXR,"C:\Program Files\WindowsApps\microsoft.windowscommunicationsapps_16005.13228.41011.0_x64__8wekyb3d8bbwe\commsapps.exe" -ServerName:microsoft.windowslive.mail.AppXvpbcm2ctr1y0sg80nt9m7z51p2cqvsxm.mca,commsapps.exe,612,9240
MSI-9SEXR,C:\Windows\System32\oobe\UserOOBEBroker.exe -Embedding,UserOOBEBroker.exe,612,6084
MSI-9SEXR,,vmcompute.exe,760,7784
MSI-9SEXR,,svchost.exe,760,13528
MSI-9SEXR,C:\Windows\system32\DllHost.exe /Processid:{AB8902B4-09CA-4BB6-B78D-A8F59079A8D5},dllhost.exe,612,2620
MSI-9SEXR,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --type=utility --utility-sub-type=audio.mojom.AudioService --field-trial-handle=1628,8223917166689525299,12993788025602838451,131072 --lang=fr --service-sandbox-type=audio --enable-audio-service-sandbox --mojo-platform-channel-handle=5984 /prefetch:8,chrome.exe,2156,13104
MSI-9SEXR,"C:\Program Files (x86)\Adobe\Acrobat DC\Acrobat\AcroTray.exe" ,acrotray.exe,4756,13936
MSI-9SEXR,,svchost.exe,760,6552
MSI-9SEXR,"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" ,powershell.exe,4756,13840
MSI-9SEXR,\??\C:\Windows\system32\conhost.exe 0x4,conhost.exe,13840,13480
MSI-9SEXR,"C:\Program Files\WindowsApps\Microsoft.YourPhone_1.20092.108.0_x64__8wekyb3d8bbwe\YourPhone.exe" -ServerName:App.AppX9yct9q388jvt4h7y0gn06smzkxcsnt8m.mca,YourPhone.exe,612,9316
MSI-9SEXR,C:\Windows\System32\RuntimeBroker.exe -Embedding,RuntimeBroker.exe,612,2792
MSI-9SEXR,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --type=renderer --field-trial-handle=1628,8223917166689525299,12993788025602838451,131072 --lang=fr --enable-auto-reload --device-scale-factor=1.25 --num-raster-threads=4 --enable-main-frame-before-activation --renderer-client-id=39 --no-v8-untrusted-code-mitigations --mojo-platform-channel-handle=4624 /prefetch:1,chrome.exe,2156,2020
MSI-9SEXR,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --type=renderer --field-trial-handle=1628,8223917166689525299,12993788025602838451,131072 --lang=fr --enable-auto-reload --device-scale-factor=1.25 --num-raster-threads=4 --enable-main-frame-before-activation --renderer-client-id=42 --no-v8-untrusted-code-mitigations --mojo-platform-channel-handle=5668 /prefetch:1,chrome.exe,2156,9560
MSI-9SEXR,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --type=renderer --field-trial-handle=1628,8223917166689525299,12993788025602838451,131072 --lang=fr --enable-auto-reload --device-scale-factor=1.25 --num-raster-threads=4 --enable-main-frame-before-activation --renderer-client-id=43 --no-v8-untrusted-code-mitigations --mojo-platform-channel-handle=4004 /prefetch:1,chrome.exe,2156,3988
MSI-9SEXR,,vds.exe,760,9372
MSI-9SEXR,,svchost.exe,760,13532
MSI-9SEXR,,svchost.exe,760,8520
MSI-9SEXR,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --type=renderer --field-trial-handle=1628,8223917166689525299,12993788025602838451,131072 --lang=fr --enable-auto-reload --device-scale-factor=1.25 --num-raster-threads=4 --enable-main-frame-before-activation --renderer-client-id=239 --no-v8-untrusted-code-mitigations --mojo-platform-channel-handle=6040 /prefetch:1,chrome.exe,2156,14352
MSI-9SEXR,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --type=renderer --field-trial-handle=1628,8223917166689525299,12993788025602838451,131072 --lang=fr --enable-auto-reload --device-scale-factor=1.25 --num-raster-threads=4 --enable-main-frame-before-activation --renderer-client-id=243 --no-v8-untrusted-code-mitigations --mojo-platform-channel-handle=4964 /prefetch:1,chrome.exe,2156,13664
MSI-9SEXR,,svchost.exe,760,13324
MSI-9SEXR,C:\Windows\system32\svchost.exe -k UdkSvcGroup -s UdkUserSvc,svchost.exe,760,10460
MSI-9SEXR,C:\Windows\System32\SystemSettingsBroker.exe -Embedding,SystemSettingsBroker.exe,612,14624
MSI-9SEXR,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --type=renderer --field-trial-handle=1628,8223917166689525299,12993788025602838451,131072 --lang=fr --enable-auto-reload --device-scale-factor=1.25 --num-raster-threads=4 --enable-main-frame-before-activation --renderer-client-id=259 --no-v8-untrusted-code-mitigations --mojo-platform-channel-handle=6240 /prefetch:1,chrome.exe,2156,7112
MSI-9SEXR,"C:\Windows\ImmersiveControlPanel\SystemSettings.exe" -ServerName:microsoft.windows.immersivecontrolpanel,SystemSettings.exe,612,7096
MSI-9SEXR,C:\Windows\System32\smartscreen.exe -Embedding,smartscreen.exe,612,2752
MSI-9SEXR,,WmiPrvSE.exe,612,2236
MSI-9SEXR,"C:\Windows\System32\Wbem\WMIC.exe" process get description,processid,parentprocessid,commandline /format:csv,WMIC.exe,13840,8752
````
#### Explication de processus Windows : 

SvcHost.exe est un processus qui sert à charger des bibliothèques de liens dynamiques(DLL), c'est un hôte de service qui fournit des fonctions aux applications qui en ont besoin.
Conhost.exe est un processus qui gère la fenêtre de l'invite de commande
RunTimeBroker.exe est un processus qui gère les permissions des applications du windows store.
Explorer.exe est un processus qui gère l'affichage de la barre des tâches, l'explorateur windows etc .. il gère l'UI de windows en général.
WinLogon.exe est un composant qui gère l'ouverture et la fermeture de session.

## 5. Network

#### Cartes réseaux
````
Get-NetAdapter -Physical
Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  Realtek PCIe GbE Family Controller           18 Up           00-D8-61-E2-4F-CD         1 Gbps
Wi-Fi                     Intel(R) Wireless-AC 9560 160MHz             14 Disconnected 80-32-53-7E-AE-64          0 bps
````
La carte réseau Realtek (01) est une carte Ethernet, elle permet la connexion aux réseaux filliaires à l'aide d'un cable Ethernet.
La carte réseau Intel (02) est une carte wifi, elle permet la connexion aux réseaux wifi sans fil.

#### Ports TCP / UDP en cours d'utilisation
````
netstat -ab

Connexions actives

  Proto  Adresse locale         Adresse distante       État
  TCP    0.0.0.0:135            pubads:0               LISTENING
  RpcSs
 [svchost.exe]
  TCP    0.0.0.0:445            pubads:0               LISTENING
 Impossible d’obtenir les informations de propriétaire
  TCP    0.0.0.0:808            pubads:0               LISTENING
 [OneApp.IGCC.WinService.exe]
  TCP    0.0.0.0:5040           pubads:0               LISTENING
  CDPSvc
 [svchost.exe]
  TCP    0.0.0.0:49664          pubads:0               LISTENING
 [lsass.exe]
  TCP    0.0.0.0:49665          pubads:0               LISTENING
 Impossible d’obtenir les informations de propriétaire
  TCP    0.0.0.0:49666          pubads:0               LISTENING
  Schedule
 [svchost.exe]
  TCP    0.0.0.0:49667          pubads:0               LISTENING
  EventLog
 [svchost.exe]
  TCP    0.0.0.0:63708          pubads:0               LISTENING
 [spoolsv.exe]
  TCP    0.0.0.0:63713          pubads:0               LISTENING
 Impossible d’obtenir les informations de propriétaire
  TCP    10.33.1.18:139         pubads:0               LISTENING
 Impossible d’obtenir les informations de propriétaire
  TCP    10.33.1.18:63732       40.90.137.127:https    TIME_WAIT
  TCP    10.33.1.18:63735       40.67.254.36:https     ESTABLISHED
  WpnService
 [svchost.exe]
  TCP    10.33.1.18:63746       93.184.220.29:http     TIME_WAIT
  TCP    10.33.1.18:63768       51.138.106.75:https    TIME_WAIT
  TCP    10.33.1.18:63797       a88-221-41-139:https   ESTABLISHED
 [WinStore.App.exe]
  TCP    10.33.1.18:63801       a88-221-41-139:https   ESTABLISHED
 [WinStore.App.exe]
  TCP    10.33.1.18:63804       93.184.220.29:http     TIME_WAIT
  TCP    10.33.1.18:63807       8.36.80.212:http       TIME_WAIT
  TCP    10.33.1.18:63808       a88-221-42-227:http    ESTABLISHED
 [WinStore.App.exe]
  TCP    10.33.1.18:63809       a88-221-42-227:http    ESTABLISHED
 [WinStore.App.exe]
  TCP    10.33.1.18:63810       a88-221-42-227:http    ESTABLISHED
 [WinStore.App.exe]
  TCP    10.33.1.18:63811       a88-221-42-227:http    ESTABLISHED
 [WinStore.App.exe]
  TCP    10.33.1.18:63812       a88-221-42-227:http    ESTABLISHED
 [WinStore.App.exe]
  TCP    10.33.1.18:63837       20.54.7.166:https      TIME_WAIT
  TCP    10.33.1.18:63838       93.184.221.240:http    TIME_WAIT
  TCP    10.33.1.18:63842       fra16s20-in-f16:https  TIME_WAIT
  TCP    10.33.1.18:63843       52.155.94.78:https     TIME_WAIT
  TCP    10.33.1.18:63844       52.155.94.78:https     TIME_WAIT
  TCP    10.33.1.18:63845       108.177.122.188:5228   ESTABLISHED
 [chrome.exe]
  TCP    10.33.1.18:63846       13.107.21.200:https    ESTABLISHED
 [SearchApp.exe]
  TCP    10.33.1.18:63850       40.90.137.127:https    TIME_WAIT
  TCP    10.33.1.18:63851       13.107.5.88:https      ESTABLISHED
 [YourPhone.exe]
  TCP    10.33.1.18:63852       93.184.220.29:http     ESTABLISHED
 [YourPhone.exe]
  TCP    10.33.1.18:63853       93.184.220.29:http     TIME_WAIT
  TCP    10.33.1.18:63854       93.184.221.240:http    TIME_WAIT
  TCP    10.33.1.18:63857       40.100.174.2:https     ESTABLISHED
 [HxTsr.exe]
  TCP    10.33.1.18:63859       a92-123-140-17:http    TIME_WAIT
  TCP    10.33.1.18:63861       52.109.88.8:https      ESTABLISHED
 [commsapps.exe]
  TCP    10.33.1.18:63863       93.184.220.29:http     TIME_WAIT
  TCP    10.33.1.18:63864       93.184.221.240:http    TIME_WAIT
  TCP    10.33.1.18:63865       uklon6-vip-bx-007:http  TIME_WAIT
  TCP    10.33.1.18:63866       151.101.18.133:http    TIME_WAIT
  TCP    10.33.1.18:63867       40.90.137.127:https    TIME_WAIT
  TCP    10.33.1.18:63868       52.113.194.132:https   ESTABLISHED
 [commsapps.exe]
  TCP    10.33.1.18:63869       93.184.221.240:http    TIME_WAIT
  TCP    10.33.1.18:63874       20.190.3.175:https     TIME_WAIT
  TCP    10.33.1.18:63875       20.190.3.175:https     TIME_WAIT
  TCP    10.33.1.18:63877       par10s27-in-f195:https  ESTABLISHED
 [chrome.exe]
  TCP    10.33.1.18:63878       mil04s23-in-f14:http   TIME_WAIT
  TCP    10.33.1.18:63884       77:http                TIME_WAIT
  TCP    10.33.1.18:63885       52.114.77.164:https    TIME_WAIT
  TCP    10.33.1.18:63886       52.114.77.164:https    TIME_WAIT
  TCP    10.33.1.18:63888       104.45.177.233:https   TIME_WAIT
  TCP    10.33.1.18:63889       8.248.183.254:http     TIME_WAIT
  TCP    10.33.1.18:63891       8.248.183.254:http     TIME_WAIT
  TCP    10.33.1.18:63892       104.45.177.233:https   TIME_WAIT
  TCP    10.33.1.18:63893       ya-in-f100:https       ESTABLISHED
 [chrome.exe]
  TCP    10.33.1.18:63896       par10s29-in-f238:https  ESTABLISHED
 [chrome.exe]
  TCP    10.33.1.18:63897       162.125.64.1:https     ESTABLISHED
 [chrome.exe]
  TCP    10.33.1.18:63898       93.184.220.29:http     TIME_WAIT
  TCP    10.33.1.18:63899       40.90.137.127:https    ESTABLISHED
  wlidsvc
 [svchost.exe]
  TCP    10.33.1.18:63900       52.114.77.164:https    TIME_WAIT
  TCP    10.33.1.18:63901       ec2-18-179-138-200:https  ESTABLISHED
 [chrome.exe]
  TCP    10.33.1.18:63905       mil07s08-in-f10:https  TIME_WAIT
  TCP    10.33.1.18:63907       52.114.128.73:https    TIME_WAIT
  TCP    10.33.1.18:63908       gap-prime-finance:https  TIME_WAIT
  TCP    10.33.1.18:63909       52.114.128.73:https    TIME_WAIT
  TCP    10.33.1.18:63910       93.184.220.29:http     ESTABLISHED
  CryptSvc
 [svchost.exe]
  TCP    10.33.1.18:63911       93.184.220.29:http     ESTABLISHED
  CryptSvc
 [svchost.exe]
  TCP    10.33.1.18:63912       fra16s45-in-f10:https  ESTABLISHED
 [chrome.exe]
  TCP    10.33.1.18:63913       52.114.128.73:https    TIME_WAIT
  TCP    10.33.1.18:63914       52.155.169.137:https   TIME_WAIT
  TCP    10.33.1.18:63915       199.232.58.248:https   ESTABLISHED
  BITS
 [svchost.exe]
  TCP    10.33.1.18:63916       51.104.167.255:https   TIME_WAIT
  TCP    10.33.1.18:63917       a104-98-230-2:https    ESTABLISHED
 Impossible d’obtenir les informations de propriétaire
  TCP    10.33.1.18:63918       204.79.197.222:https   ESTABLISHED
 [SearchApp.exe]
  TCP    10.33.1.18:63919       a104-98-230-2:https    ESTABLISHED
 Impossible d’obtenir les informations de propriétaire
  TCP    10.33.1.18:63920       93.184.220.29:http     ESTABLISHED
 [SearchApp.exe]
  TCP    10.33.1.18:63921       93.184.221.240:http    TIME_WAIT
  TCP    10.33.1.18:63922       93.184.221.240:http    TIME_WAIT
  TCP    10.33.1.18:63926       52.114.74.45:https     TIME_WAIT
  TCP    10.33.1.18:63927       bingforbusiness:https  ESTABLISHED
 [SearchApp.exe]
  TCP    10.33.1.18:63928       40.90.23.206:https     ESTABLISHED
  wlidsvc
 [svchost.exe]
  TCP    10.33.1.18:63929       13.107.6.254:https     ESTABLISHED
 [SearchApp.exe]
  TCP    10.33.1.18:63930       131.253.33.254:https   ESTABLISHED
 [SearchApp.exe]
  TCP    10.33.1.18:63931       13.107.246.254:https   ESTABLISHED
 [SearchApp.exe]
  TCP    10.33.1.18:63932       20.190.143.50:https    ESTABLISHED
 [SearchApp.exe]
  TCP    10.33.1.18:63933       20.190.143.50:https    ESTABLISHED
 [SearchApp.exe]
  TCP    10.33.1.18:63934       20.190.143.50:https    ESTABLISHED
 [SearchApp.exe]
  TCP    10.33.1.18:63935       52.114.74.45:https     TIME_WAIT
  TCP    10.33.1.18:63936       104.31.90.96:https     ESTABLISHED
 [chrome.exe]
  TCP    10.33.1.18:63937       52.114.74.45:https     TIME_WAIT
  TCP    10.33.1.18:63938       a2-16-167-48:http      ESTABLISHED
 Impossible d’obtenir les informations de propriétaire
  TCP    10.33.1.18:63939       r-20-38-62-5:http      ESTABLISHED
 Impossible d’obtenir les informations de propriétaire
  TCP    10.33.1.18:63940       a92-123-140-9:http     ESTABLISHED
 Impossible d’obtenir les informations de propriétaire
  TCP    10.33.1.18:63941       a92-123-140-16:http    ESTABLISHED
 Impossible d’obtenir les informations de propriétaire
  TCP    127.0.0.1:63756        pubads:0               LISTENING
 [NVIDIA Web Helper.exe]
  TCP    127.0.0.1:63762        MSI-9SEXR:65001        ESTABLISHED
 [nvcontainer.exe]
  TCP    127.0.0.1:65001        pubads:0               LISTENING
 [nvcontainer.exe]
  TCP    127.0.0.1:65001        MSI-9SEXR:63762        ESTABLISHED
 [nvcontainer.exe]
  TCP    192.168.56.1:139       pubads:0               LISTENING
 Impossible d’obtenir les informations de propriétaire
  TCP    [::]:135               MSI-9SEXR:0            LISTENING
  RpcSs
 [svchost.exe]
  TCP    [::]:445               MSI-9SEXR:0            LISTENING
 Impossible d’obtenir les informations de propriétaire
  TCP    [::]:808               MSI-9SEXR:0            LISTENING
 [OneApp.IGCC.WinService.exe]
  TCP    [::]:49664             MSI-9SEXR:0            LISTENING
 [lsass.exe]
  TCP    [::]:49665             MSI-9SEXR:0            LISTENING
 Impossible d’obtenir les informations de propriétaire
  TCP    [::]:49666             MSI-9SEXR:0            LISTENING
  Schedule
 [svchost.exe]
  TCP    [::]:49667             MSI-9SEXR:0            LISTENING
  EventLog
 [svchost.exe]
  TCP    [::]:63708             MSI-9SEXR:0            LISTENING
 [spoolsv.exe]
  TCP    [::]:63713             MSI-9SEXR:0            LISTENING
 Impossible d’obtenir les informations de propriétaire
  TCP    [::1]:63709            MSI-9SEXR:0            LISTENING
 [jhi_service.exe]
  UDP    0.0.0.0:500            *:*
  IKEEXT
 [svchost.exe]
  UDP    0.0.0.0:3702           *:*
 [dashost.exe]
  UDP    0.0.0.0:3702           *:*
 [dashost.exe]
  UDP    0.0.0.0:4500           *:*
  IKEEXT
 [svchost.exe]
  UDP    0.0.0.0:5050           *:*
  CDPSvc
 [svchost.exe]
  UDP    0.0.0.0:5353           *:*
  Dnscache
 [svchost.exe]
  UDP    0.0.0.0:5353           *:*
 [chrome.exe]
  UDP    0.0.0.0:5353           *:*
 [chrome.exe]
  UDP    0.0.0.0:5353           *:*
 [chrome.exe]
  UDP    0.0.0.0:5353           *:*
 [chrome.exe]
  UDP    0.0.0.0:5355           *:*
  Dnscache
 [svchost.exe]
  UDP    0.0.0.0:57187          *:*
 [dashost.exe]
  UDP    0.0.0.0:58611          *:*
 [nvcontainer.exe]
  UDP    10.33.1.18:137         *:*
 Impossible d’obtenir les informations de propriétaire
  UDP    10.33.1.18:138         *:*
 Impossible d’obtenir les informations de propriétaire
  UDP    10.33.1.18:1900        *:*
  SSDPSRV
 [svchost.exe]
  UDP    10.33.1.18:5353        *:*
 [nvcontainer.exe]
  UDP    10.33.1.18:56209       *:*
  SSDPSRV
 [svchost.exe]
  UDP    127.0.0.1:1900         *:*
  SSDPSRV
 [svchost.exe]
  UDP    127.0.0.1:10010        *:*
 [NVIDIA Web Helper.exe]
  UDP    127.0.0.1:51117        *:*
 [nvcontainer.exe]
  UDP    127.0.0.1:56208        *:*
  SSDPSRV
 [svchost.exe]
  UDP    127.0.0.1:61869        *:*
  iphlpsvc
 [svchost.exe]
  UDP    192.168.56.1:137       *:*
 Impossible d’obtenir les informations de propriétaire
  UDP    192.168.56.1:138       *:*
 Impossible d’obtenir les informations de propriétaire
  UDP    192.168.56.1:1900      *:*
  SSDPSRV
 [svchost.exe]
  UDP    192.168.56.1:5353      *:*
 [nvcontainer.exe]
  UDP    192.168.56.1:56207     *:*
  SSDPSRV
 [svchost.exe]
  UDP    [::]:500               *:*
  IKEEXT
 [svchost.exe]
  UDP    [::]:3702              *:*
 [dashost.exe]
  UDP    [::]:3702              *:*
 [dashost.exe]
  UDP    [::]:4500              *:*
  IKEEXT
 [svchost.exe]
  UDP    [::]:5353              *:*
 [chrome.exe]
  UDP    [::]:5353              *:*
  Dnscache
 [svchost.exe]
  UDP    [::]:5353              *:*
 [chrome.exe]
  UDP    [::]:5355              *:*
  Dnscache
 [svchost.exe]
  UDP    [::]:57188             *:*
 [dashost.exe]
  UDP    [::]:58612             *:*
 [nvcontainer.exe]
  UDP    [::1]:1900             *:*
  SSDPSRV
 [svchost.exe]
  UDP    [::1]:5353             *:*
 [nvcontainer.exe]
  UDP    [::1]:56205            *:*
  SSDPSRV
 [svchost.exe]
  UDP    [fe80::3cf8:a059:5132:d3c1%16]:1900  *:*
  SSDPSRV
 [svchost.exe]
  UDP    [fe80::3cf8:a059:5132:d3c1%16]:56206  *:*
  SSDPSRV
 [svchost.exe]
  UDP    [fe80::506d:75da:7205:84f4%24]:1900  *:*
  SSDPSRV
 [svchost.exe]
  UDP    [fe80::506d:75da:7205:84f4%24]:56204  *:*
  SSDPSRV
 [svchost.exe]
 ````
#### A quoi servent ces ports ?

Les ports TCP et UDP sont les 2 principaux protocoles utilisés dans la couche de transport ( modèle OSI )
Ces deux protocoles permettent l'échange de paquets d’information entre 2 machines avec l'utilisation de leur adresse IP et d'un numéro de port. (:xxxxx)
 
# III. Gestion de softs

#### **Intérêt de l'utilisation d'un gestionnaire de paquets**

L'utilisation d'un gestionnaire de packet permet de faciliter l'installation, la mise à niveau et la gestion des programmes installés sur notre ordinateur

Avec un gestionnaire de paquets,  on peut rapidement installer ou supprimer plusieurs programmes.

De plus, on est garanti de la provenance du programme qu'on veut télécharger, ce qui assure la sécurité du fichier, et la correspondance avec le fichier d'origine.


#### **Utiliser chocolatey**

Lister tous les paquets déjà installés sur l'ordinateur : 
```
**choco list** 
5397 packages found.
```
Lister les paquets installés avec chocolatey : 
`choco list -l`

Voir la provenance des paquets : 
`choco source`

On peut également vérifier la source d'un paquet en particulier en mettant son nom après choco source.

# IV. Machine virtuelle

## 1/2. Install de l'os sur la VM

Nous avons crées ensemble une machine virtuelle de CentOs qui possède sa propre carte réseau à l'aide du logiciel VirtualBox

## 3. Configuration post install

#### Setup carte réseau :

Pour lister les cartes réseaux sur CentOs:
`ip a`
puis on setup la carte réseau avec : (enp0s8 étant le nom de la carte réseau)
```
ifup enp0s8
```
On refait ip a pour vérifier qu'une IP lui a bien été attribuée puis on peut passer à la suite.

#### Effectuer la connexion SSH depuis le PC vers la VM : 

Cela nous permettra d'effectuer des commandes sur la VM depuis PowerShell
```
PS C:\Windows\system32> ssh root@192.168.120.50
root@192.168.120.50's password:
Last login: Mon Nov  9 13:19:00 2020 from 192.168.120.1
[root@localhost ~]#
```
## 4. Partage de fichiers

### Créer le serveur sur mon PC :
Etant sur windows, il est simple de partager le dossier puisqu'il suffit de faire un clic droit sur notre dossier -> Propriétés et mettre les autorisations en lecture et en écriture.
J'ai donc crée un dossier "Partage".

### Accéder au partage depuis la VM : 
Grâce à la connexion SSH, nous pouvons lancer les commandes qui suivent directement depuis powershell.

1. On installe un paquet qui nous permettra de setup le partage avec Samba :
`yum install -y cifs-utils`

2. On crée un dossier qui nous permettra d'accéder au partage : 
`mkdir /opt/partage`

3. Puis il faut monter le partage dans la VM : 
`mount -t cifs -o username=yrlan //192.168.1.43/Partage /opt/partage`
J'ai retiré "password" après l'username, PowerShell fais une nouvelle ligne ou il demande de taper le mot de passe.


Voilà, le partage est mis en place, on y accède en faisant : 
`cd /opt/partage`
Powershell affiche : `[root@localhost partage]#`

### Créer et modifier des fichiers

On peut maintenant créer des fichiers avec **touch** ou des dossiers avec **mkdir** : 
`touch test1.txt` `touch test2.txt` `touch test3.txt` `mkdir Exemple`
```
[root@localhost partage]# ls
Exemple test1.txt  test2.txt  test3.txt
```
On peut également les supprimer avec rm ou rmdir
`rm test2.txt` `rm test3.txt`

#### **Utilisation de vi**

Pour les modifier, il faut utiliser **vi**
1. On ouvre le fichier et on passe en mode insertion : `vi test1.txt` -> `i`
2. J'ai écris mon texte puis j'ai fais `Echap` pour retourner en mode commande
3. Une fois en mode commande, on peut taper `ZZ`, cela permet de sauvegarder les modifications et de fermer le fichier.

On peut ensuite vérifier dans Windows que le texte a bien été modifié.