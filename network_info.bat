@echo off
setlocal

set "OUTPUT=network_info.txt"

echo ============================================== > "%OUTPUT%"
echo DEVICE NETWORK INFORMATION REPORT >> "%OUTPUT%"
echo ============================================== >> "%OUTPUT%"
echo. >> "%OUTPUT%"

echo [DATE AND TIME] >> "%OUTPUT%"
date /t >> "%OUTPUT%"
time /t >> "%OUTPUT%"
echo. >> "%OUTPUT%"

echo [COMPUTER NAME] >> "%OUTPUT%"
hostname >> "%OUTPUT%"
echo. >> "%OUTPUT%"

echo [IP CONFIGURATION] >> "%OUTPUT%"
ipconfig /all >> "%OUTPUT%"
echo. >> "%OUTPUT%"

echo [MAC, IP ADDRESS AND SUBNET MASK] >> "%OUTPUT%"
for /f "tokens=1,2,*" %%A in ('ipconfig /all ^| findstr /i /c:"Physical Address" /c:"IPv4 Address" /c:"Subnet Mask"') do (
    echo %%A %%B %%C >> "%OUTPUT%"
)
echo. >> "%OUTPUT%"

echo Report saved as "%OUTPUT%".
echo Attach "%OUTPUT%" to the designated email address.
endlocal
