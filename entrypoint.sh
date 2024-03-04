
nginx

if test $1 == 73 ; then
  /opt/remi/php73/root/sbin/php-fpm -R
elif test $1 == 74 ; then
  /opt/remi/php74/root/sbin/php-fpm -R
else
  /opt/remi/php80/root/sbin/php-fpm -R
fi

redis-server /etc/redis.conf
