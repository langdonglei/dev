nginx

if test $1 == 80 ; then
  /opt/remi/php80/root/sbin/php-fpm -R
else
  /opt/remi/php74/root/sbin/php-fpm -R
fi

redis-server /etc/redis.conf
