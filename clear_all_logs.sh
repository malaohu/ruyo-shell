 echo > /var/log/wtmp //清除用户登录记录

 echo > /var/log/btmp //清除尝试登录记录

 echo > /var/log/lastlog //清除最近登录信息

 echo > /var/log/secure //登录信息

 echo > /var/log/messages

 echo > /var/log/syslog //记录系统日志的服务

 echo > /var/log/xferlog

 echo > /var/log/auth.log

 echo > /var/log/user.log
  echo > /var/run/utmp

 cat /dev/null > /var/log/openwebmail.log

 cat /dev/null > /var/log/boot.log
cat /dev/null > /var/log/btmp
cat /dev/null > /var/log/cron
cat /dev/null > /var/log/dmesg
cat /dev/null > /var/log/firewalld
cat /dev/null > /var/log/grubby
cat /dev/null > /var/log/lastlog
cat /dev/null > /var/log/mail.info
cat /dev/null > /var/log/maillog
cat /dev/null > /var/log/messages
cat /dev/null > /var/log/secure
cat /dev/null > /var/log/spooler
cat /dev/null > /var/log/syslog
cat /dev/null > /var/log/tallylog
cat /dev/null > /var/log/wpa_supplicant.log
cat /dev/null > /var/log/wtmp
cat /dev/null > /var/log/yum.log
