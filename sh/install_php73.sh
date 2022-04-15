dnf install -y \
    php73-php-cli \
    php73-php-fpm \
    php73-php-xml \
    php73-php-mbstring \
    php73-php-pgsql \
    php73-php-zip \
    php73-php-redis \
    php73-php-bcmath \
    php73-php-gd \
    php73-php-swoole \
    php73-php-process \
    php73-php-pecl-xdebug3-3.0.3-1.el8.remi.x86_64

cat >> /etc/opt/remi/php73/php.ini << EOF
error_reporting=E_ALL
display_errors=1
date.timezone=PRC
zend.assertions=1
EOF

cat >> /etc/opt/remi/php73/php.d/15-xdebug.ini << EOF
xdebug.mode=debug
xdebug.client_host=192.168.1.222
EOF

sed -i 's|apache|root|g' /etc/opt/remi/php73/php-fpm.d/www.conf
sed -i 's|nodaemonize|nodaemonize -R|' /lib/systemd/system/php73-php-fpm.service

systemctl enable php73-php-fpm
ln -s /usr/bin/php73 /usr/local/bin/php