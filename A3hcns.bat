@echo off
cmdkey /del:10.4.6.252
cmdkey /add:10.4.6.252 /user:hcnsstaff /pass:Admin@123
explorer \\10.4.6.252\HR
net use H: "\\10.4.6.252\HR" /persistent:yes
explorer \\10.4.6.252\HR