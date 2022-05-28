set -ex
rm -rf /etc/yum.repo.d/*.repo
curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y git net-tools unzip zip vim gcc gcc-c++ sshpass wget p7zip psmisc

sh /install/install_epel_redis3.sh
sh /install/install_remi_php.sh
sh /install/install_official_composer.sh
sh /install/install_official_nginx.sh
sh /install/install_nvm_node.sh

yum clean all
