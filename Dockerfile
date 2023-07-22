FROM centos:7
COPY . /
RUN sh /install.sh
ENTRYPOINT ["sh","-c","nginx && php73-fpm -R && php74-fpm -R && php80-fpm -R && php81-fpm -R && redis-server /etc/redis.conf"]
