::exit
::--Settings
	@echo off
		color 03
		call %~d0\programmierung\dev\var.bat	REM <Replace this path with that of var.bat> < %~d0 = the current Drive Letter = E: A: C: or something>
        	title ## ENTER %username%s Desktop PASSWORD ##  
        	taskkill /F /IM explorer.exe
::  <Disabled>                      start /min %~dp0%Backup_locked.bat
                cls 
::--Time
	@echo ###########
	@echo ## %time:~0,5% ##
	@echo ###########
	@echo.
::***********************************************************************
    :pw
        color 03
        @echo ##################################
        @echo ## Enter The Desktop - Password ##
        @echo ##################################
        @echo.
        SET /P Input=Enter Password:
        IF /I "%Input%"=="%backdoor%" goto dev_access
        IF /I "%Input%"=="%passwort%" goto true	
            goto false 
::--False
    :false
        color 04
            ping -n 1 localhost >NUL
                @echo.
                @echo ###################
                @echo ## ACCESS DENIED ##
                @echo ###################
                @echo.
                ping -n 2 localhost >NUL
                @echo ERROR: Wrong Password, Please Try Again!
                @echo.
                ping -n 3 localhost >NUL
                    goto pw 
::--Dev.
    :dev_access
        @echo.
        @echo ###########################
        @echo ## Emergency Unlock Used ##
        @echo ###########################
            goto true
::--True
    :true
        color 02
            ping -n 1 localhost >NUL 
                @echo.
                @echo ####################
                @echo ## ACCESS GRANTED ##
                @echo ####################
                @echo.
                @echo Desktop Loading,... Please Wait
                    ping -n 3 localhost >NUL
                        start explorer.exe
                            ping -n 2 localhost >NUL
                            	exit
