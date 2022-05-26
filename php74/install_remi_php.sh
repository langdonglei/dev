yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
arr=(72 73 74 80)
for i in ${arr[@]}
do
    yum install -y \
        php${i}-php-cli \
        php${i}-php-fpm \
        php${i}-php-xml \
        php${i}-php-mbstring \
        php${i}-php-pgsql \
        php${i}-php-zip \
        php${i}-php-redis \
        php${i}-php-bcmath \
        php${i}-php-gd \
        php${i}-php-swoole \
        php${i}-php-process \
        php${i}-php-pecl-xdebug3

    cat >> /etc/opt/remi/php${i}/php.ini << EOF
    error_reporting=E_ALL
    display_errors=1
    date.timezone=PRC
    zend.assertions=1
EOF

    cat >> /etc/opt/remi/php${i}/php.d/15-xdebug.ini << EOF
    xdebug.mode=debug
    xdebug.discover_client_host=true
EOF

    sed -i 's|apache|root|g' /etc/opt/remi/php${i}/php-fpm.d/www.conf
    sed -i "s|listen = 127.0.0.1:9000|listen = /run/php${}-fpm.sock|g" /etc/opt/remi/php${i}/php-fpm.d/www.conf
done

ln -s /usr/bin/php80 /usr/local/bin/php