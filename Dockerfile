FROM centos:8
RUN echo '[nginx]' > /etc/yum.repos.d/nginx.repo && \
    echo 'name=nginx' >> /etc/yum.repos.d/nginx.repo && \
    echo 'baseurl=http://nginx.org/packages/centos/$releasever/$basearch/' >> /etc/yum.repos.d/nginx.repo && \
    echo 'gpgcheck=1' >> /etc/yum.repos.d/nginx.repo && \
    echo 'enabled=1' >> /etc/yum.repos.d/nginx.repo && \
    echo 'gpgkey=https://nginx.org/keys/nginx_signing.key' >> /etc/yum.repos.d/nginx.repo && \
    echo 'module_hotfixes=true' >> /etc/yum.repos.d/nginx.repo && \
    dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm && \
    # openssh
    # dnf install -y openssh-server sshpass passwd && \
    # systemctl enable sshd && echo root:root | chpasswd && \
    # tool
    dnf install -y \
    net-tools \
    unzip \
    zip \
    vim \
    git \
    gcc \
    gcc-c++ \
    wget && \
    # nginx
    dnf install -y nginx && \
    sed -i 's|user  nginx|user  root|' /etc/nginx/nginx.conf && \
    systemctl enable nginx && \    
    # php
    dnf install -y php73-php-cli php73-php-fpm && \
    systemctl enable php73-php-fpm && \
    ln -s /usr/bin/php73 /usr/local/bin/php && \
    echo 'error_reporting = E_ALL' >> /etc/opt/remi/php73/php.ini && \
    echo 'display_errors = 1' >> /etc/opt/remi/php73/php.ini && \
    echo 'date.timezone = PRC' >> /etc/opt/remi/php73/php.ini && \
    echo 'zend.assertions = 1' >> /etc/opt/remi/php73/php.ini && \
    echo 'listen=127.0.0.1:9000' >> /etc/opt/remi/php73/php-fpm.d/www.conf && \
    sed -i 's|apache|root|g' /etc/opt/remi/php73/php-fpm.d/www.conf && \
    sed -i 's|nodaemonize|nodaemonize -R|' /lib/systemd/system/php73-php-fpm.service && \
    # php-ext
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
    php73-php-pecl-xdebug3-3.0.3-1.el8.remi.x86_64 && \
    echo 'xdebug.mode = debug' >> /etc/opt/remi/php73/php.d/15-xdebug.ini && \
    echo 'xdebug.client_host = 192.168.1.222' >> /etc/opt/remi/php73/php.d/15-xdebug.ini && \
    # composer
    curl -L https://github.com/composer/composer/releases/download/1.10.19/composer.phar -o /usr/local/bin/composer && \
    chmod a+x /usr/local/bin/composer && \
    echo "PATH=\$PATH:/root/.composer/vendor/bin" >> /etc/profile && \
    echo "export PATH" >> /etc/profile && \
    composer global require laravel/installer && \
    # /root/.composer/vendor/bin/laravel new ~/template_laravel && \
    composer config -g repo.packagist composer https://mirrors.aliyun.com/composer && \
    # node-js
    dnf install -y @nodejs:12 && \
    npm install -g yarn yrm bower && \
    yarn global add @vue/cli && \
    yrm use taobao && \
    # redis
    dnf install -y @redis:5 && \
    systemctl enable redis && \
    sed -i 's|bind 127.0.0.1|bind 0.0.0.0|g' /etc/redis.conf && \
    sed -i 's|protected-mode yes|protected-mode no|g' /etc/redis.conf && \
    sed -i 's|# requirepass foobared|requirepass foobared|g' /etc/redis.conf && \
    # mysql
    dnf install -y @mysql:8.0 && \
    systemctl enable mysqld && \
    # postgresql
    dnf install -y @postgresql:12 glibc-langpack-en && \
    systemctl enable postgresql && \
    echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf && \
    echo "host all all 0.0.0.0/0 trust" >> /var/lib/pgsql/data/pg_hba.conf && \
    # delete
    rm -rf /root/anaconda-ks.cfg && \
    rm -rf /root/anaconda-post.log && \
    rm -rf /root/original-ks.cfg


# mysql      密码是空 需要手动修改远程登录 update mysql.user set host = '%' where user = 'root';flush privileges;
# postgresql 密码是空 需要手动初始化 postgresql-setup --init


# todo
# mysql -uroot --execute "update mysql.user set host = '%' where user = 'root';"
# mysql -uroot --execute "alter user root identified with mysql_native_password by 'root';"
# mysql -uroot --execute "flush privileges;"
# todo
# postgresql-setup --init
# echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf
# echo "host all all 0.0.0.0/0 md5" >> /var/lib/pgsql/data/pg_hba.conf
# systemctl start postgresql
# su postgres -c "psql -c \"alter user postgres with password 'postgres'\";"

# todo
# nginx root fpm root


#[mysqld]

#pid-file=/var/run/mysqld/mysqld.pid
#socket=/var/run/mysqld/mysqld.sock
#datadir=/var/lib/mysql

#skip-host-cache
#skip-name-resolve

#bind-address=0.0.0.0
#max_connect_errors=10
#character-set-server=utf8
#default-storage-engine=INNODB
#default_authentication_plugin=mysql_native_password

# 用户操作
# select user, host, plugin, authentication_string from user
# CREATE USER 'xxx'@'%' IDENTIFIED WITH mysql_native_password BY 'xxx';
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'xxx';

# 权限操作
# show grants for 'xxh'@'%';
# GRANT ALL PRIVILEGES ON *.* TO 'xxh'@'%'；
# GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON *.* TO 'xxh'@'%';
