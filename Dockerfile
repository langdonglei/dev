FROM centos:8
COPY sh /sh
RUN sh /sh/main.sh
