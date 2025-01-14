# This script removes all the unwanted applications that come with Windows 10.
# Please note I have chosen to remove most of the apps as I don't need them. This script might not fit your needs.

# Privilege Escalation
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

# Path to the file containing the list of packages to uninstall
$packageListFile = "packages.txt"

# Ensure the package list file exists
if (Test-Path $packageListFile) {
    # Read each line (package name) from the file
    $packages = Get-Content $packageListFile
    
    # Loop through each package and remove it
    foreach ($package in $packages) {
	# Remove AppxPackages
	Get-AppxPackage -AllUsers $package | Remove-AppxPackage
	# Remove AppxPackages for All Users
        Get-AppxPackage -AllUsers $package | Remove-AppxPackage -AllUsers
    }
} else {
    Write-Host "Package list file not found: $packageListFile"
}


pause
