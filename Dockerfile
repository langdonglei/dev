FROM centos:7
COPY . /
RUN sh /sh/c7_base.sh
RUN sh /sh/c7_nginx.sh
RUN sh /sh/c7_redis.sh
RUN sh /sh/c7_php.sh
RUN sh /sh/composer.sh
ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["74"]
