yum install -y openssh-server sshpass passwd
ssh-keygen -A
echo root:root | chpasswd
