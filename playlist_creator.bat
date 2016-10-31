CHCP 1252
@ECHO Off
SETLOCAL

:: make a tempfile
:maketemp
SET "tempfile=%temp%\%random%"
IF EXIST "%tempfile%*" (GOTO maketemp) ELSE (ECHO.>"%tempfile%a")



:: Need the start of the tree to scan
SET "rootdir=H:\music"
>"%tempfile%b" (ECHO(%rootdir%&ECHO(*)
FOR /f "delims=:" %%a IN ('FINDSTR /o /L "*" "%tempfile%b"') DO SET /a len=%%a-1

SET "destfile=%~1"

:loop
SHIFT
SET "nextdir=%~1"
REM SET nextdir=%~1
rem SET next=%nextdir:&=^^^&%
rem echo %next%
IF NOT DEFINED nextdir GOTO process
IF %nextdir:~0,1%==\ (
 PUSHD "%~1"
 FOR /f "delims=" %%a IN ('dir /b /s /a-d *.mp3 *.mp4 *.ogg *.m4a *.wma *.flac *.wav') DO >>"%tempfile%a" ECHO(%%~na:2:%%a
) else (
 PUSHD "%rootdir%\%~1"
 FOR /f "delims=" %%a IN ('dir /b /s /a-d *.mp3 *.mp4 *.ogg *.m4a *.wma *.flac *.wav') DO >>"%tempfile%a" ECHO(%%~na:%len%:%%a
)
POPD 
GOTO loop

:process
>%destfile% ECHO(#EXTM3U
(
FOR /f "tokens=1,2*delims=:" %%a IN ('SORT "%tempfile%a"') DO (
 ECHO(#EXTINF:???,%%a
 SET "location=%%c"
 SETLOCAL enabledelayedexpansion
  set "location=!location:~%%b!"
  set "back=../"
  ECHO(!back!!location!
 endlocal
)
)>>%destfile%

 del "%tempfile%*"

GOTO :EOF