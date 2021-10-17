@echo off

echo.
if /i "%1" == "help" (
echo Type 'reboot' to instantly restart the machine.
) else (
shutdown /r
)