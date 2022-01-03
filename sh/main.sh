dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm
dnf install -y net-tools unzip zip vim git gcc gcc-c++ sshpass wget

sh /sh/install_nginx.sh
sh /sh/install_php80.sh

sh /sh/install_composer.sh
