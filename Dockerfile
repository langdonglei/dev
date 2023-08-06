FROM centos:7
COPY . /
RUN sh /install.sh
ENTRYPOINT ["sh","-c","nginx && /opt/remi/php74/root/sbin/php-fpm -R && redis-server /etc/redis.conf"]
