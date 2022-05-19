yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm

yum install -y \
    php74-php-cli \
    php74-php-fpm \
    php74-php-xml \
    php74-php-mbstring \
    php74-php-pgsql \
    php74-php-zip \
    php74-php-redis \
    php74-php-bcmath \
    php74-php-gd \
    php74-php-swoole \
    php74-php-process \
    php74-php-pecl-xdebug3

cat >> /etc/opt/remi/php74/php.ini << EOF
error_reporting=E_ALL
display_errors=1
date.timezone=PRC
zend.assertions=1
EOF

cat >> /etc/opt/remi/php74/php.d/15-xdebug.ini << EOF
xdebug.mode=debug
xdebug.client_host=192.168.1.176
EOF

sed -i 's|apache|root|g' /etc/opt/remi/php74/php-fpm.d/www.conf
sed -i 's|nodaemonize|nodaemonize -R|' /lib/systemd/system/php74-php-fpm.service

ln -s /usr/bin/php74 /usr/local/bin/php
ln -s /opt/remi/php74/root/sbin/php-fpm /usr/local/bin/fpm
