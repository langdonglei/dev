set -ex

yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum install -y git net-tools unzip zip vim gcc gcc-c++ sshpass wget p7zip psmisc

sh /install_epel_redis3.sh

sh /install_remi_php.sh

sh /install_official_composer.sh

sh /install_official_nginx.sh

sh /install_nvm.sh

cp /default.conf /etc/nginx/conf.d/default.conf

sed -i 's|root /www|root /www/public|'

yum clean all
