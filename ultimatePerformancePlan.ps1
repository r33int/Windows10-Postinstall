# Enables Windows 10 "ultimate" performance plan on any device.
# Reference: https://www.thewindowsclub.com/ultimate-performance-power-plan/
# Optional

# Privilege Escalation
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61

pause
