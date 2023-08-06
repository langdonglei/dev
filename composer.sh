set -ex
curl -L https://github.com/composer/composer/releases/download/2.1.3/composer.phar -o /usr/local/bin/composer
chmod a+x /usr/local/bin/composer
#composer config -g repo.packagist composer https://mirrors.aliyun.com/composer
