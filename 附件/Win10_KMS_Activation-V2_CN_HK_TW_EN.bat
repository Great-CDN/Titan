@echo off&setlocal EnableDelayedExpansion & color 3e
title KMS_Activation for Windows 10 - [By������ �ᰮ�ƽ�]
call :strset
if defined str0 goto en
echo ::::::::::::::::::::::::::::::::::::::::::::::::
echo    %str1%
echo.
echo    %str2%
echo.
echo                                2016-4, By������
echo ::::::::::::::::::::::::::::::::::::::::::::::::
echo.&timeout /t 10
:en
:: ����԰������и�ʽ����µ� KMS ������

set a1=kms.landiannews.com
set a2=zh.us.to
set a3=kms.shuax.com
set a4=skms.ddns.net
set a5=kms.aglc.cc
set a6=xykz.f3322.org		
set a7=kms.xspace.in

:: ���������� 50 ��KMS������

::======================= ��������������� ======================
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
	set str1=�Զ���� Win10 �İ汾��������Ӧ�� KMS ��Կ
	set str2=Ȼ������ָ���� KMS ���������� Win10
	set str3=ѡ��� KMS ������:
	set str4=δ�������������Կ:
	set str5=����Ѿ������رմ�������
	set str6=������ʧ��[����: 0xC004F074]������������ز˵���Ȼ��ѡ�������� KMS ��������
	set str7=��ǰ����ϵͳ���� Windows 10. 
	set str8=�롰�Թ���Ա������С���������
	set str9=��������˳�...
	set str10=��ѡ�� KMS ������
	set str11=�˳�
	set str12=������ѡ��ķ�������ţ��س�ȷ�ϣ�:
	set str13=ѡ�����...
)
chcp | find "950" > nul && (
	set bar====================
	set str1=�۰��ˬd Win10 �������A�ɤJ������ KMS �K�_
	set str2=�M�Z�s�����w�� KMS �A�Ⱦ��ҥ� Win10
	set str3=��ܪ� KMS �A�Ⱦ�:
	set str4=���o�{�ҩw�q���K�_:
	set str5=�p�G�w�g�ҥΡA����������B�z�C
	set str6=�Y�ҥΥ���[���~: 0xC004F074]�A�����N���^���A�M�Z��ܨ�L�� KMS �A�Ⱦ��C
	set str7=��e�ާ@�t�Τ��O Windows 10. 
	set str8=�С��H�޲z�������B�桨�ӧ�B�z�C
	set str9=�����N��h�X...
	set str10=�п�� KMS �A�Ⱦ�
	set str11=�h�X
	set str12=�п�J��ܪ��A�Ⱦ��Ǹ�[�^���̻{]:
	set str13=��ܿ��~...
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
