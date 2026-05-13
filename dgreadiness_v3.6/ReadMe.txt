###########################################################################
Readiness Tool Version 3.6 Release. 
Tool to check if your device is capable to run Device Guard and Credential Guard.
How to read the output:
 1. Red Errors: Basic hardware/firmware features are missing that will prevent enabling and using DG/CG
 2. Yellow Warnings: This device is capable of running DG/CG, but some additional security qualifications are absent. To learn more, please go through: https://aka.ms/dgwhcr 
 3. Green Messages: This device is fully compliant with DG/CG requirements
 
 Note:
 * For enterprise IT Pros evaluating DG/CG:
		Yellow warnings means that the machine has met baseline requirements for enabling DG/CG, and therefore the features can be enabled.
		For yellow and green outputs, we strongly recommend testing this configuration in your lab before enabling broadly.

 * For OEMs using this tool to evaluate DG/CG hardware compatibility:
		When evaluating client and server compatibility with DG/CG, the device must meet all of the hardware requirements, including additional 
		security qualifications, depending on the release timeframe.
		The current version of the tool evaluates against Windows 10, version 1703 requirements.
 
###########################################################################
OS and Hardware requirements for enabling Device Guard and Credential Guard
 1. OS SKUs: Device Guard and Credential Guard are available only on these OS SKUs - Enterprise, Professional, Home, Education, Server and Enterprise IoT
 2. OS Version: The minimum OS version to run the tool is Windows 10, Version 1607, or Windows Server 2016
 3. Hardware: Recent hardware that supports virtualization extension with SLAT
########################################################################### 

If Execution-Policy is not already set to allow running script, then you should manually set it as below and then use the readiness script:
Set-ExecutionPolicy Unrestricted

Usage: DG_Readiness.ps1 -[Capable/Ready/Enable/Disable] -[DG/CG/HVCI] -[AutoReboot] -Path
Log file with details is found here: C:\DGLogs 

To Enable DG/CG. If you have a custom SIPolicy.p7b then use the -Path parameter else the hardcoded default policy is used
Usage: DG_Readiness.ps1 -Enable OR DG_Readiness.ps1 -Enable -Path <full path to the SIPolicy.p7b> 

To enable only HVCI
Usage: DG_Readiness.ps1 -Enable -HVCI 

To enable only CG
Usage: DG_Readiness.ps1 -Enable -CG 

To Verify if DG/CG is enabled
Usage: DG_Readiness.ps1 -Ready 

To Disable DG/CG.
Usage: DG_Readiness.ps1 -Disable 

To Verify if DG/CG is disabled
Usage: DG_Readiness.ps1 -Ready 

To Verify if this device is DG/CG Capable
Usage: DG_Readiness.ps1 -Capable 

To Verify if this device is HVCI Capable
Usage: DG_Readiness.ps1 -Capable -HVCI 

To auto reboot with each option
Usage: DG_Readiness.ps1 -[Capable/Enable/Disable] -AutoReboot 

###########################################################################
Readiness Tool with '-capable' is run the following RegKey values are set:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Capabilities
CG_Capable
DG_Capable
HVCI_Capable
Value 0 = not possible to enable DG/CG/HVCI on this device
Value 1 = this device is capable of running DG/CG/HVCI, but some firmware/hardware/software needed for additional security qualifications are absent.
Value 2 = fully compatible for DG/CG/HVCI
########################################################################### 

Helpful Resources:
PC OEM requirements for Device Guard and Credential Guard: https://msdn.microsoft.com/library/windows/hardware/mt767514(v=vs.85).aspx
Deploying Credential Guard: https://technet.microsoft.com/en-us/itpro/windows/keep-secure/credential-guard#hardware-and-software-requirements
Deploying Device Guard: https://technet.microsoft.com/en-us/itpro/windows/keep-secure/requirements-and-deployment-planning-guidelines-for-device-guard

########################################################################### 
Want to customize the script?
########################################################################### 
This script has configuration to enable DG and CG without UEFI Lock: Below is the list of Regkeys and its values for customization:

For RS1 and RS2 – to enable HVCI and CG without UEFI Lock:
'REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 1 /f' 
'REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "RequirePlatformSecurityFeatures" /t REG_DWORD /d 1 /f' 
#to make both Secure Boot and DMA as required then the value should be changed to 3
'REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "Locked" /t REG_DWORD /d 0 /f' 
#to lock VBS to UEFI variables the value should be 1
'REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d 1 /f' 
'REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Locked" /t REG_DWORD /d 0 /f' 
#to lock VBS to UEFI variables the value should be 1
'REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "LsaCfgFlags" /t REG_DWORD /d 2 /f' 

For TH2 – to enable HVCI and CG without UEFI Lock:
'REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 1 /f' 
'REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "RequirePlatformSecurityFeatures" /t REG_DWORD /d 1 /f'
#to make both Secure Boot and DMA as required then the value should be changed to 3 
'REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v " Unlocked" /t REG_DWORD /d 1 /f' 
#to lock VBS to UEFI variables the value should be 0 or the key deleted
'REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "HypervisorEnforcedCodeIntegrity" /t REG_DWORD /d 1 /f' 
'REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "LsaCfgFlags" /t REG_DWORD /d 2 /f'

