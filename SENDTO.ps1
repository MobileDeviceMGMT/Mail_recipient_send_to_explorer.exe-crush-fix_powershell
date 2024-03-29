$WScriptShell = New-Object -ComObject WScript.Shell
$appdata = $env:APPDATA
$path = 'Microsoft\Windows\SendTo\Mail recipient.MAPIMail'
$TargetFile = "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
If(!(test-path $TargetFile))
{
$TargetFile = "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE"
}
$ShortcutFile = "$appdata\Microsoft\Windows\SendTo\Send via email.lnk"
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Arguments = "/c ipm.note /a"
$Shortcut.Save()
$FILE=Get-Item $appdata\$path -Force
$FILE.attributes='Hidden'