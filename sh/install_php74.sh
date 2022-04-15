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
    php74-php-pecl-xdebug3-3.0.3-1.el8.remi.x86_64

cat >> /etc/opt/remi/php74/php.ini << EOF
error_reporting=E_ALL
display_errors=1
date.timezone=PRC
zend.assertions=1
EOF

cat >> /etc/opt/remi/php74/php.d/15-xdebug.ini << EOF
xdebug.mode=debug
xdebug.client_host=192.168.1.222
EOF

sed -i 's|apache|root|g' /etc/opt/remi/php74/php-fpm.d/www.conf
sed -i 's|nodaemonize|nodaemonize -R|' /lib/systemd/system/php74-php-fpm.service

systemctl enable php74-php-fpm

# default cli php
ln -s /usr/bin/php74 /usr/local/bin/php

# composer
