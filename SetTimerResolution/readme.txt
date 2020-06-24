Info:
Per start SetTimerResolutionService calls NtQueryTimerResolution to obtain maximum timer resolution value, and then calls NtSetTimerResolution to set that value as a desired one.


Installation:
1. Make a folder somewhere and drop the service in, mine is here: (C:\Program Files (x86)\SetTimerResolutionService)
2. Open CMD as admin, then cd into where you put the folder (cd C:\Program Files (x86)\SetTimerResolutionService)
3. Copy and paste the commands below: (you probably want SetTimerResolutionService -install)

SetTimerResolutionService -install
  registers service in OS;

SetTimerResolutionService -uninstall
  unregisters service in OS;

SetTimerResolutionService -console
  main code interactively in console.
  
4. Open services.msc (windows key + r)
5. Find SetTimerResolutionService, right click, properties, set to Automatic start, then enable it