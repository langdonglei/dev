FROM centos:7
COPY . /install
RUN sh /install/install.sh
ENTRYPOINT ["nginx && fpm -R && redis-server /etc/redis.conf"]
