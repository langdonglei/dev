FROM centos:7
COPY . /
RUN sh /install.sh
ENTRYPOINT ["sh","/entrypoint.sh"]
