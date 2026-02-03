$target = "10.4.6.252"
$user   = "hcnsstaff"
$pass   = "Admin@123"
$share  = "\\10.4.6.252\HR"
$drive  = "H"

if (cmdkey /list | Select-String $target) {
    cmdkey /delete:$target
}

if (Get-PSDrive -Name $drive -ErrorAction SilentlyContinue) {
    Remove-PSDrive -Name $drive -Force
}

cmdkey /add:$target /user:$user /pass:$pass
New-PSDrive -Name $drive -PSProvider FileSystem -Root $share -Persist
Start-Process explorer "$drive:\"
