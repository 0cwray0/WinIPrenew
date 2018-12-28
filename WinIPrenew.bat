:: Name: WinIPrenew.bat
:: Author: Copyright 2018, cwray, released under the MIT License
:: See https://github.com/0cwray0/WinIPRenew/blob/master/LICENSE for the complete license text.
:: Source code at https://github.com/0cwray0/WinIPRenew
:: Issues:   Std operators ([<],[>],[,],[|],["],[;]) cause issues...
:: Todo:     None
:: Notes:    '/A' switch supports arithimetic ops...

@Echo off

SETLOCAL ENABLEEXTENSIONS 
SET me=%~n0 
SET parent=%~dp0 

Echo.
title WinIPRenew 

Echo WinIPRenew by C.Wray
Echo.
Echo CAUTION: (!!) Make sure that your renewal interval is longer than 180 seconds if connecting to the corporate network! Intervals that are too short can cause rapid cycling issues with your ip! (!!) 
Echo.
Echo OPTIONS: ["-1" will refresh on a keypress] ["1-99999" function as stated] ['e' for exit] ['h' for help]
Echo.

:: Takes input from user and sets up initial user options, and input validation.
:ch_ask
SET amtName=amtName
Echo.
SET /P amtName=Enter the renewal interval that you want to follow (in seconds) from -1-99999: 
IF %amtName% equ 0 goto valid
IF "%amtName%" == "e" GOTO:ch_exit2
IF "%amtName%" == "h" GOTO:ch_help
IF %amtName% equ -1 GOTO:ch_main

SET /a inputval="%amtName%"*1
IF %inputval% equ 0 goto invalid
IF "%inputval%" == "." goto invalid
GOTO:valid

:: Error functionality.
:invalid
Echo Input is not an integer.
Echo.
Pause
GOTO:ch_ask

:: Next set of user input validation. 
:valid
IF NOT DEFINED amtName GOTO:ch_blkerror
IF %amtName% ==0 GOTO:ch_error
IF %amtName% leq -2 GOTO:ch_bnderror
IF %amtName% geq 100000 GOTO:ch_bnderror
IF %amtName% geq 1 GOTO:ch_main
GOTO:ch_ask


:: Area where main renewal and timeout functions occur. 
:ch_main
Ipconfig /renew
Echo.
Echo IP Renewal complete!
Echo.
Echo Press [Ctrl + 'C'] to exit. Otherwise see below for your wait time...
Echo.
TIMEOUT /T %amtName%
GOTO:ch_main

:: Simply provides an overview of the offered functionality. 
:ch_help
Echo.
Echo The purpose of this batch file is to auto renew the IP of a Windows PC based upon the number of seconds that the user inputs. 
Echo.
Echo Any number from 1 and 99999 will represent the frequency of refreshal that the ip will follow. While '-1' will refresh on a keypress instead of an interval. 
Echo.
GOTO:ch_ask

:: Error functionality.
:ch_error
echo.
echo Your selection cannot be '0'. Try again.
echo.
Pause
echo.
GOTO:ch_ask

:: Error functionality.
:ch_blkerror
echo.
echo Your selection cannot be empty. Try again.
echo.
Pause
echo.
GOTO:ch_ask

:: Error functionality.
:ch_bnderror
echo.
echo Your selection cannot exist outside the bounds of this feature. Try again.
echo.
Pause
echo.
GOTO:ch_ask

:: Exit functionality.
:ch_exit
pause
exit

:: Exit functionality.
:ch_exit2
pause
exit /B
