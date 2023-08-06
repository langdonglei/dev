FROM centos:7
COPY . /
RUN sh /install.sh
RUN sh /c7_php.sh
RUN sh /composer.sh
ENTRYPOINT ["sh","-c","nginx && redis-server /etc/redis.conf"]
