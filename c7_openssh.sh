yum install -y openssh-server sshpass passwd
/usr/bin/ssh-keygen -A
echo root:root | chpasswd
sed -i 's|GSSAPIAuthentication yes|GSSAPIAuthentication no|' /etc/ssh/sshd_config
sed -i 's|#UseDNS yes|UseDNS no|' /etc/ssh/sshd_config
sed -i 's|#PermitRootLogin yes|PermitRootLogin yes|' /etc/ssh/sshd_config
