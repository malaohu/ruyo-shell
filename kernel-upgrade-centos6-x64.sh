#! /bin/bash
echo "install the kernel & headers ..."
echo "...... version 4.12.1 ......"
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
yum install -y https://github.com/malaohu/ruyo-shell/raw/master/CentOS6-X64-Kernel/4.12.1/kernel-ml-4.12.1-1.el6.elrepo.x86_64.rpm
yum remove -y kernel-headers
yum install -y https://github.com/malaohu/ruyo-shell/raw/master/CentOS6-X64-Kernel/4.12.1/kernel-ml-headers-4.12.1-1.el6.elrepo.x86_64.rpm
yum install -y https://github.com/malaohu/ruyo-shell/raw/master/CentOS6-X64-Kernel/4.12.1/kernel-ml-devel-4.12.1-1.el6.elrepo.x86_64.rpm
echo "change grub info ..."
sed -ri 's/default=1/default=0/g' /etc/grub.conf
echo "restart ..."
reboot
