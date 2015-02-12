FROM phusion/baseimage

MAINTAINER xforty technologies

RUN DEBIAN_FRONTEND=noninteractive \
 apt-get update && \
 apt-get install -y apparmor nginx php5 php5-mysql php5-fpm openssh-server php5-gd

COPY runit /etc/service

RUN \
  cd /etc/nginx/sites-enabled && \
  rm default && \
  mkdir -p /data && \
  ( [ -d /var/run/sshd ] || mkdir --mode=0755 /var/run/sshd )


EXPOSE 22 80 443

CMD /sbin/my_init


