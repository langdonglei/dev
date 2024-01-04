FROM centos:7
COPY . /
RUN sh /c7_base.sh
RUN sh /c7_nginx.sh
RUN sh /c7_redis.sh
RUN sh /c7_php.sh
RUN sh /composer.sh
RUN sh /nvm.sh
#ENTRYPOINT ["sh","-c","nginx && php-fpm -R && redis-server /etc/redis.conf"]
ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["74"]
