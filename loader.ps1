$target = "10.4.6.252"
$user   = "hcnsstaff"
$pass   = "Admin@123"
$share  = "\\10.4.6.252\HR"
$drive  = "H"

# Kiểm tra credential đã tồn tại chưa
$credExists = cmdkey /list | Select-String $target

if ($credExists) {
    cmdkey /delete:$target
}

# Thêm credential mới
cmdkey /add:$target /user:$user /pass:$pass

# Nếu ổ H: đã tồn tại thì xoá trước
if (Get-PSDrive -Name $drive -ErrorAction SilentlyContinue) {
    Remove-PSDrive -Name $drive -Force
}

# Map ổ mạng
New-PSDrive -Name $drive -PSProvider FileSystem -Root $share -Persist

# Mở thư mục
Start-Process explorer "$drive:\"


