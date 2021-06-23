FROM centos:8
COPY sh /sh
RUN sh /sh/run.sh
