# Windows 10 timer tweaks
# May improve responsiveness when gaming.
# Effectiveness of these tweaks may defer from machine to machine. Do not run this if you do not know what you're doing. 

bcdedit /deletevalue useplatformtick

bcdedit /deletevalue useplatformclock

bcdedit /deletevalue tscsyncpolicy

bcdedit /deletevalue disabledynamictick

pause
