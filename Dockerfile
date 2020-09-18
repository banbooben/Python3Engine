FROM ubuntu:latest

WORKDIR /
COPY ./* /

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && apt-get clean \
    && cd ~ && mkdir .pip/ && mv /pip.conf ~/.pip/pip.conf \
    && mkdir -p /var/run/sshd \
    && echo "/usr/sbin/sshd -D" > /run.sh && chmod +x /run.sh

RUN apt-get update && \
    apt-get install -y ca-certificates python3 python3-dev python3-pip openssh-server\
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* 

RUN echo "root:root" | chpasswd \
    && sed  -ri 's/session  required  pam_loginuid.so/#session  required  pam_loginuid.so/g' /etc/pam.d/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -y \
    && mkdir -p ~/.ssh \
    && mv /authorized_keys ~/.ssh/authorized_keys && chmod 777 ~/.ssh/authorized_keys
#开放端口
EXPOSE 22
CMD sh /run.sh
