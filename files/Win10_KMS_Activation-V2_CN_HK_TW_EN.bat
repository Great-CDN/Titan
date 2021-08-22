@echo off&setlocal EnableDelayedExpansion & color 3e
title KMS_Activation for Windows 10 - [By：相守 吾爱破解]
call :strset
if defined str0 goto en
echo ::::::::::::::::::::::::::::::::::::::::::::::::
echo    %str1%
echo.
echo    %str2%
echo.
echo                                2016-4, By：相守
echo ::::::::::::::::::::::::::::::::::::::::::::::::
echo.&timeout /t 10
:en
:: 你可以按照下列格式添加新的 KMS 服务器

set a1=kms.landiannews.com
set a2=zh.us.to
set a3=kms.shuax.com
set a4=skms.ddns.net
set a5=kms.aglc.cc
set a6=xykz.f3322.org		
set a7=kms.xspace.in

:: 最多可以设置 50 个KMS服务器

::======================= 以下内容无需更改 ======================
call :verchk
call :adminchk
call :setkey
call :menu

:DO
echo.&echo %str3% !a%s%! &echo.

for /f "tokens=3 delims= " %%i in ('reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID"') do set EditionID=%%i

if defined %EditionID% (
	cscript //Nologo %windir%\system32\slmgr.vbs /ipk !%EditionID%!
	cscript //Nologo %windir%\system32\slmgr.vbs /skms !a%s%!
	cscript //Nologo %windir%\system32\slmgr.vbs /ato
) else (
	echo.&echo %str4% "%EditionID%"
	echo.
)
echo %bar%%bar%%bar%&echo %str5%
echo.&echo %str6%
echo %bar%%bar%%bar%&pause
call :menu
exit

:verchk
ver | find "10.0." >nul 2>nul && (goto :EOF)
echo.&echo %str7%
echo.&pause
exit

:adminchk
reg query "HKU\S-1-5-19" >nul 2>nul || (
cls&echo.&echo %str8%
echo.&echo %str9%
echo.&pause>nul
exit)
goto :EOF

:menu
set n=1&cls
echo.&echo       %str10%
echo %bar%%bar%%bar%
for /L %%i in (1,1,50) do (if defined a%%i (echo  !n! - !a%%i!
	set /a n+=1))
echo.&echo  q - %str11%
echo %bar%%bar%%bar%
set /p s=%str12% 
if /i "%s%" EQU "q" exit
if not "!a%s%!".=="".  goto DO
echo %str13%&pause>nul&goto menu

:setkey
set Core=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
set CoreCountrySpecific=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
set CoreN=3KHY7-WNT83-DGQKR-F7HPR-844BM
set CoreSingleLanguage=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
set ProfessionalStudent=YNXW3-HV3VB-Y83VG-KPBXM-6VH3Q
set ProfessionalStudentN=8G9XJ-GN6PJ-GW787-MVV7G-GMR99
set Professional=W269N-WFGWX-YVC9B-4J6C9-T83GX
set ProfessionalN=MH37W-N47XK-V7XM9-C7227-GCQG9
set ProfessionalSN=8Q36Y-N2F39-HRMHT-4XW33-TCQR4
set ProfessionalWMC=NKPM6-TCVPT-3HRFX-Q4H9B-QJ34Y
set Enterprise=NPPR9-FWDCX-D2C8J-H872K-2YT43
set EnterpriseN=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
set Education=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
set EducationN=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
set EnterpriseS=WNMTR-4C88C-JK8YV-HQ7T2-76DF9
set EnterpriseSN=2F77B-TNFGY-69QQF-B8YKP-D69TJ
goto :EOF

:strset
chcp | find "936" > nul && (
	set bar====================
	set str1=自动检查 Win10 的版本，导入相应的 KMS 密钥
	set str2=然后连接指定的 KMS 服务器激活 Win10
	set str3=选择的 KMS 服务器:
	set str4=未发现所定义的密钥:
	set str5=如果已经激活，请关闭此批处理。
	set str6=若激活失败[错误: 0xC004F074]，按任意键返回菜单，然后选择其他的 KMS 服务器。
	set str7=当前操作系统不是 Windows 10. 
	set str8=请“以管理员身份运行”该批处理。
	set str9=按任意键退出...
	set str10=请选择 KMS 服务器
	set str11=退出
	set str12=请输入选择的服务器序号（回车确认）:
	set str13=选择错误...
)
chcp | find "950" > nul && (
	set bar====================
	set str1=笆浪琩 Win10 セ旧莱 KMS 盞芲
	set str2=礛硈钡﹚ KMS 狝叭竟币ノ Win10
	set str3=匡拒 KMS 狝叭竟:
	set str4=ゼ祇瞷┮﹚竡盞芲:
	set str5=狦竒币ノ叫闽超у矪瞶
	set str6=璝币ノア毖[岿粇: 0xC004F074]ヴ種龄垫虫礛匡拒ㄤ KMS 狝叭竟
	set str7=讽玡巨╰参ぃ琌 Windows 10. 
	set str8=叫¨恨瞶ō笲︽〃赣у矪瞶
	set str9=ヴ種龄癶...
	set str10=叫匡拒 KMS 狝叭竟
	set str11=癶
	set str12=叫块匡拒狝叭竟腹[ó谔粄]:
	set str13=匡拒岿粇...
)
if not defined str1 (
	set bar====================
	set str0=nocn
	set str3=The selected KMS Server:
	set str4=Not Found the DEFINED key:
	set str5=If Product activated successfully, EXIT pls.
	set str6=If Product activated failure [Error: 0xC004F074], press any key to the Menu.
	set str7=The current OS is NOT Windows 10.
	set str8=Run as ADMINISTRATOR, Pls.
	set str9=Press any key to exit...
	set str10=Select KMS Server
	set str11=Exit
	set str12=Input the number, then press Enter:
	set str13=Select ERROR...
)
goto :EOF
