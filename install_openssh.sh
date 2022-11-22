dnf install -y openssh-server sshpass passwd
ssh-keygen -A
echo root:root | chpasswd
systemctl enable sshd
