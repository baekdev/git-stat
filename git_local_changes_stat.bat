@echo off
setlocal enabledelayedexpansion

REM Counters for insertions and deletions
set plus=0
set minus=0
set count=0

REM Range of change size
set rangeTo[XS]=10
set rangeTo[S]=50
set rangeTo[M]=100
set rangeTo[L]=250

REM Color Variables
set "BLACKC=[30m"
set "REDC=[31m"
set "REDB=[41m"
set "GREENB=[42m"
set "YELLOWB=[43m"
set "BLUEC=[34m"
set "BLUEB=[44m"
set "MAGENTB=[45m"
set "NORMALB=[49m"
set "NORMALC=[0m"


REM Calculate the changes
for /f "tokens=1,2" %%a in ('git diff --cached --numstat') do (
    set /a plus+=%%a
    set /a minus+=%%b
    set /a count+=1
)

REM Output the results
echo ^>^>^> Git Local Changes Stat

if %plus% leq 0 if %minus% leq 0 (
    echo ^>^>^> Any no changes
    exit /b 0
)

set /a sum=plus+minus
set size=XS
set color=!GREENB!

if !sum! lss !rangeTo[XS]! (
    set size=XS
    set color=!GREENB!
) else if !sum! lss !rangeTo[S]! (
    set size=S
    set color=!BLUEB!
) else if !sum! lss !rangeTo[M]! (
    set size=M
    set color=!YELLOWB!
) else if !sum! lss !rangeTo[L]! (
    set size=L
    set color=!MAGENTB!
) else (
    set size=XL
    set color=!REDB!
)

echo ^>^>^> !count! files, !REDC!!plus! insertions(+), !BLUEC!!minus! deletions(-)!NORMALB!!NORMALC!
echo ^>^>^> !color!Your commit size is !size!!NORMALB!!NORMALC!
