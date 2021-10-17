@echo off

echo.
if /i "%1" == "help" (
echo Type 'poweroff' to instantly shutdown the machine.
) else (
shutdown /s /t 0
)