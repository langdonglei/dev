FROM centos:7
COPY . /
RUN sh /install.sh
ENTRYPOINT ["sh","-c","nginx && php-fpm -R && redis-server /etc/redis.conf"]
