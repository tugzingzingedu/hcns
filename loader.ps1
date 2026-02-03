$target = "10.4.6.252"
$share  = "\\10.4.6.252\HR"
$drive  = "H"

# =========================
# XOÁ CREDENTIAL CŨ (NẾU CÓ)
# =========================
cmdkey /delete:$target 2>$null

# =========================
# XOÁ Ổ MẠNG CŨ (NET USE)
# =========================
net use "$drive:" /delete /yes 2>$null

# =========================
# XOÁ Ổ PSDrive (NẾU CÓ)
# =========================
if (Get-PSDrive -Name $drive -ErrorAction SilentlyContinue) {
    Remove-PSDrive -Name $drive -Force
}

# =========================
# THÊM CREDENTIAL MỚI
# =========================
cmdkey /add:$target /user:hcnsstaff /pass:Admin@123

# =========================
# MAP Ổ MẠNG
# =========================
net use "$drive:" $share /persistent:yes

# =========================
# MỞ THƯ MỤC
# =========================
Start-Process explorer "$drive:\"
