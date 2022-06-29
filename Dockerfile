FROM centos:7
COPY . /install
RUN sh /install/install.sh
