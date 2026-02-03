cmdkey /delete:10.4.6.252
cmdkey /add:10.4.6.252 /user:hcnsstaff /pass:Admin@123

Start-Process explorer "\\10.4.6.252\HR"

net use H: "\\10.4.6.252\HR" /persistent:yes

Start-Process explorer "\\10.4.6.252\HR"

