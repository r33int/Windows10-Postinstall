# NTFS filesystem tweaks
# Thanks to: https://notes.ponderworthy.com/fsutil-tweaks-for-ntfs-performance-and-reliability
# NOTE: You may want to adapt your drive letters. This script assumes C: and D: letters are used

# Privilege Escalation
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

fsutil behavior set memoryusage 2
fsutil behavior set disablelastaccess 1
fsutil behavior set mftzone 2

$DriveLetters = (Get-WmiObject -Class Win32_Volume).DriveLetter
ForEach ($Drive in $DriveLetters){
    If (-not ([string]::IsNullOrEmpty($Drive))){
        Write-Host Optimizing "$Drive" Drive
        fsutil resource setavailable "$Drive":\
        fsutil resource setlog shrink 10 "$Drive":\
    }
}
