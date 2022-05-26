dnf install -y openssh-server sshpass passwd

echo root:root | chpasswd

systemctl enable sshd
