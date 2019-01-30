# use lts as base image
# debain 9 cat /etc/issue

FROM jenkins/jenkins:lts

# add more executors,default is 2.

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# update the timezone

USER root

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ 
    echo 'Asia/Shanghai' >/etc/timezone

# install package

## install the offcial ansible repo

RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list && \
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
apt-get update && apt-get install -y ansible

# install plugins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

