#  Windows10-Postinstall

This repo contains a set of scripts & tools that I use to prepare my new Windows 10 installations. It improves performance, privacy, and makes the system cleaner overall.

**main branch: Removes Cortana, Xbox services, OneDrive, Windows Defender, useless apps, and services.**

**Important:** I tried to include references and credits in my scripts as much as possible. I recommend you to read the explanations about the scripts & tools below, before running them, as it can cause unwanted effects on your system.
I am not responsible for any damage caused to your system.



## Scripts:

|Script|Description|
|--|--|
|contentDeliveryManager.ps1|This script completely prevents Windows 10 from automatically installing unwanted sponsored apps & games. <br>For reference: [https://blog.drhack.net/disable-windows-10-app-install-without-consent/](https://blog.drhack.net/disable-windows-10-app-install-without-consent/)|
|fsutil.ps1|This script applies various tweaks for the NTFS filesystem using the fsutil command. <br>For reference: [https://notes.ponderworthy.com/fsutil-tweaks-for-ntfs-performance-and-reliability](https://notes.ponderworthy.com/fsutil-tweaks-for-ntfs-performance-and-reliability)|
|registryTweaks.ps1|This script contains various tweaks that apply to Windows's registry. The tweaks are the following: <br><br>-   Set system clock to UTC, to prevent clock desyncs when multi-booting other systems such as Linux and macOS. This tweak does not cause any issue in the case of single-booting. <br><br>- Disable full-screen optimizations in games. This tweak allows games to use exclusive full-screen mode, thus can improve gaming performance and decrease latency. <br><br>-   Prevent Malware Removal Tool from automatically installing via Windows Update. That can be unsafe, but we are not using Windows Defender anyway. Only use if you are sure you do not need an antivirus. <br><br>-   Disable NetBIOS over TCP/IP. This service is legacy, vulnerable, and shouldn't be used anymore. Do not use if your computer belongs to your organization, and you are not sure. For reference: [https://geekflare.com/netbios-disable-windows/](https://geekflare.com/netbios-disable-windows/) <br><br>-   Disable web search in Windows Search.|
|removeApps.ps1|This script uninstalls "useless" UWP apps for the current user, to make the system as minimal as possible. Please make sure this script does not uninstall any app that you need before running it. <br>Note: Most apps can be manually reinstalled from the Microsoft Store.
|removeOneDrive.ps1|This script completely removes OneDrive features from Windows. Do not run if you use OneDrive. <br>Credits: [https://github.com/Sycnex/Windows10Debloater](https://github.com/Sycnex/Windows10Debloater)
|scheduledTasks.ps1|This script disables some default scheduled tasks, mostly tasks used for telemetry and data collection. Improves privacy.
|services.ps1|This script disables "useless" Windows services. Services disabled are the following:<br><br>-   Windows Error Reporting<br>-   OneDrive sync Service<br>-   Program Compatibility Assistant (does not disable compatibility features, only the assistant.)<br>-   Messaging Services<br>-   Retail Demo<br>-   Diagnostics Hub Data Collector<br>-   Geolocation Services<br>-   AllJoyn Router Services<br>-   Remote Registry<br>-   Data Usage Monitor Service<br>-   Diagnostics Tracking Service<br>-   Downloaded Maps Manager<br><br> This script also disables all Xbox-related services.
|ultimatePerformancePlan.ps1|This script enables the hidden "ultimate" performance plan. Enabling that can improve performance significantly. For reference: [https://www.howtogeek.com/368781/how-to-enable-ultimate-performance-power-plan-in-windows-10/](https://www.howtogeek.com/368781/how-to-enable-ultimate-performance-power-plan-in-windows-10/)
|GameBarPresenceWriter|Removes a leftover Xbox Game Bar related program that appears whenever a game is running, and shouldn't be there. Reduces overhead. <br>For reference: [https://www.reddit.com/r/DestinyTechSupport/comments/amq3g1/i_think_i_found_the_root_cause_of_the_stuttering/](https://www.reddit.com/r/DestinyTechSupport/comments/amq3g1/i_think_i_found_the_root_cause_of_the_stuttering/)

## LGPO:
LGPO is a tool that can import/export the local [group policy](https://en.wikipedia.org/wiki/Group_Policy) of Windows. I included my group policy in this repo as well. Here is a non-exhaustive list of the settings enforced in my group policy:

-   Disable Windows Update auto-updates.
-   Disable Windows Update automatic driver installation (I prefer installing drivers from the respective manufacturers' websites).
-   Disable Windows Defender. That significantly improves performance and reduces overhead, but can reduce security, if you are not careful enough.
-   Disable Geolocation Services.
-   Limit telemetry to the minimum level.
-   Disable Windows Spotlight on the lock screen.

Be aware my group policy can contain personal preferences that you may not want.

While I strongly advise you to build your group policy yourself, you can use mine by importing it using the LGPO tool.

Run the following command in an elevated command prompt or PowerShell Window, with your current directory set to LGPO:

    LGPO.exe /g policy

## Tools:
|Tool|Description|
|--|--|
|Autoruns|[Autoruns](https://docs.microsoft.com/en-us/sysinternals/downloads/autoruns) is a useful tool from Windows [Sysinternals](https://docs.microsoft.com/en-us/sysinternals/) that helps manage and remove programs, services, scheduled tasks, system extensions, and more that automatically run at startup.|
|cru-1.4.1|[Custom Resolution Utility](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU) is a tool used to create and manage custom monitor resolutions. You probably do not need this tool, but I have included it for personal reasons.|
|MSI_util_v2|This tool is used to enable message-signaled interrupts for internal devices. That can improve performance and decrease latency. Can cause issues with older devices, use with caution. <br>For reference: [https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044/](https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044/)<br>[https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-message-signaled-interrupts](https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-message-signaled-interrupts)|
|Winaero Tweaker|[Winaero Tweaker](https://winaero.com/winaero-tweaker/) is a tool from [Winaero](https://winaero.com/) that exposes hidden Windows settings and registry tweaks with a nice-looking user interface. There are many options to explore there. Use this tool at your convenience.|
|InSpectre|[InSpectre](https://www.grc.com/inspectre.htm) is a tool from [Gibson Research Corporation](https://www.grc.com/intro.htm). This tool can enable/disable [Meltdown and Spectre](https://meltdownattack.com/) mitigations. It also determines the performance hit by the mitigations. <br>Disabling mitigations can improve performance but is discouraged due to security implications.|

## Please report any issues you find in my scripts. I am also very open to contributions. Thanks!
