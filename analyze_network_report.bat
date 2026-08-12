@echo off
setlocal

set "INPUT=network_info.txt"
set "REPORT=report.txt"

if not exist "%INPUT%" (
    echo ERROR: "%INPUT%" was not found.
    echo Place the attachment in the same folder as this script and run again.
    exit /b 1
)

echo ============================================== > "%REPORT%"
echo NETWORK STATUS ANALYSIS REPORT >> "%REPORT%"
echo ============================================== >> "%REPORT%"
echo. >> "%REPORT%"

echo [SOURCE FILE] >> "%REPORT%"
echo %INPUT% >> "%REPORT%"
echo. >> "%REPORT%"

echo [COMPUTER NAME] >> "%REPORT%"
for /f "delims=" %%A in ('findstr /i /c:"[COMPUTER NAME]" "%INPUT%"') do set "FOUND=1"
for /f "tokens=*" %%A in ('findstr /v /i /c:"[COMPUTER NAME]" "%INPUT%"') do (
    rem Processing is intentionally kept simple for a batch assignment.
)
hostname >> "%REPORT%"
echo. >> "%REPORT%"

echo [IPV4 ADDRESSES] >> "%REPORT%"
findstr /i "IPv4" "%INPUT%" >> "%REPORT%"
echo. >> "%REPORT%"

echo [SUBNET MASKS] >> "%REPORT%"
findstr /i "Subnet Mask" "%INPUT%" >> "%REPORT%"
echo. >> "%REPORT%"

echo [MAC ADDRESSES] >> "%REPORT%"
findstr /i "Physical Address" "%INPUT%" >> "%REPORT%"
echo. >> "%REPORT%"

echo [DEFAULT GATEWAY] >> "%REPORT%"
findstr /i "Default Gateway" "%INPUT%" >> "%REPORT%"
echo. >> "%REPORT%"

echo [NETWORK CONNECTIVITY TEST] >> "%REPORT%"
ping -n 4 8.8.8.8 >> "%REPORT%"
echo. >> "%REPORT%"

echo [DNS TEST] >> "%REPORT%"
nslookup example.com >> "%REPORT%"
echo. >> "%REPORT%"

echo ============================================== >> "%REPORT%"
echo END OF REPORT >> "%REPORT%"
echo ============================================== >> "%REPORT%"

echo Analysis complete. "%REPORT%" has been created.
endlocal
