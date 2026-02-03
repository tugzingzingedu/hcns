$target = "10.4.6.252"
$share  = "\\10.4.6.252\HR"
$drive  = "H"

# =========================
# XOÁ CREDENTIAL CŨ (NẾU CÓ)
# =========================
if (cmdkey /list | Select-String $target) {
    cmdkey /delete:$target
}

# =========================
# XOÁ Ổ MẠNG ĐÃ MAP (NẾU CÓ)
# =========================
if (Get-PSDrive -Name $drive -ErrorAction SilentlyContinue) {
    net use "$drive:" /delete /yes
}

# =========================
# THÊM CREDENTIAL MỚI
# =========================
cmdkey /add:$target /user:hcnsstaff /pass:Admin@123

# =========================
# MỞ SHARE
# =========================
Start-Process explorer $share

# =========================
# MAP Ổ MẠNG
# =========================
net use "$drive:" $share /persistent:yes

# =========================
# MỞ LẠI SHARE
# =========================
Start-Process explorer $share
