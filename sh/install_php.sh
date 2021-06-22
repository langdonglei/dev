dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm

dnf install -y php73-php-cli php73-php-fpm

cat >> /etc/opt/remi/php73/php.ini << EOF
error_reporting = E_ALL
display_errors = 1
date.timezone = PRC
zend.assertions = 1
EOF
cat >> /etc/opt/remi/php73/php-fpm.d/www.conf << EOF
listen=127.0.0.1:9000
EOF
sed -i 's|apache|root|g' /etc/opt/remi/php73/php-fpm.d/www.conf
sed -i 's|nodaemonize|nodaemonize -R|' /lib/systemd/system/php73-php-fpm.service

systemctl enable php73-php-fpm

ln -s /usr/bin/php73 /usr/local/bin/php


dnf install -y \
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
cat >> /etc/opt/remi/php73/php.d/15-xdebug.ini << EOF
xdebug.mode = debug
xdebug.client_host = 192.168.1.222
EOF

curl -L https://github.com/composer/composer/releases/download/2.1.3/composer.phar -o /usr/local/bin/composer
chmod a+x /usr/local/bin/composer
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer
