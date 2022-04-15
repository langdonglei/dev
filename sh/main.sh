rm -rf /etc/yum.repo.d/*.repo
curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo

yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install -y net-tools unzip zip vim git gcc gcc-c++ sshpass wget p7zip

sh /sh/install_nginx.sh
sh /sh/install_redis5.sh
sh /sh/install_php74.sh
sh /sh/install_composer.sh

