rm -rf /etc/yum.repo.d/*.repo
curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo


dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm
dnf install -y net-tools unzip zip vim git gcc gcc-c++ sshpass wget p7zip

sh /sh/install_nginx.sh
sh /sh/install_redis5.sh
sh /sh/install_php80.sh
sh /sh/install_composer.sh
sh /sh/install_nodejs12.sh
