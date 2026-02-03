# =========================
# CẤU HÌNH
# =========================
$target = "10.4.6.252"
$user   = "hcnsstaff"
$pass   = "Admin@123"
$share  = "\\10.4.6.252\HR"
$drive  = "H"

# =========================
# XOÁ CREDENTIAL CŨ (NẾU CÓ)
# =========================
$credExists = cmdkey /list | Select-String $target
if ($credExists) {
    cmdkey /delete:$target
}

# =========================
# THÊM CREDENTIAL MỚI
# =========================
cmdkey /add:$target /user:$user /pass:$pass

# =========================
# XOÁ Ổ MẠNG CŨ (NẾU CÓ)
# =========================
if (Get-PSDrive -Name $drive -ErrorAction SilentlyContinue) {
    Remove-PSDrive -Name $drive -Force
}

# =========================
# MAP Ổ MẠNG
# =========================
New-PSDrive -Name $drive -PSProvider FileSystem -Root $share -Persist

# =========================
# MỞ EXPLORER
# =========================
Start-Process explorer "$drive:\"
