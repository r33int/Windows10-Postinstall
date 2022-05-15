Dim tCommand

tCommand = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%ProgramFiles%\Windows Defender\MSASCui.exe")
If Not (CreateObject("Scripting.FileSystemObject").FileExists(tCommand)) Then tCommand = "windowsdefender://Threatsettings"
CreateObject("Shell.Application").ShellExecute(tCommand)
