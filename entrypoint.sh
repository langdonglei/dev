nginx

if test $1 == 80 ; then
  php-fpm-80 -R
else
  php-fpm-74 -R
fi

redis-server /etc/redis.conf
