set -ex

yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum install -y git net-tools bind-utils unzip zip vim gcc gcc-c++ sshpass wget p7zip psmisc

sh /install_epel_redis3.sh

sh /install_nginx.sh

yum clean all


