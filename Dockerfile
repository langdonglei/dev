FROM centos:7
COPY sh /sh
RUN sh /sh/main.sh
