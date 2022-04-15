dnf install -y \
    php80-php-cli \
    php80-php-fpm \
    php80-php-xml \
    php80-php-mbstring \
    php80-php-pgsql \
    php80-php-zip \
    php80-php-redis \
    php80-php-bcmath \
    php80-php-gd \
    php80-php-swoole \
    php80-php-process \
    php80-php-pecl-xdebug3

cat >> /etc/opt/remi/php80/php.ini << EOF
error_reporting=E_ALL
display_errors=1
date.timezone=PRC
zend.assertions=1
EOF

cat >> /etc/opt/remi/php80/php.d/15-xdebug.ini << EOF
xdebug.mode=debug
xdebug.client_host=192.168.1.222
EOF

sed -i 's|apache|root|g' /etc/opt/remi/php80/php-fpm.d/www.conf
sed -i 's|nodaemonize|nodaemonize -R|' /lib/systemd/system/php80-php-fpm.service

systemctl enable php80-php-fpm
ln -s /usr/bin/php80 /usr/local/bin/php