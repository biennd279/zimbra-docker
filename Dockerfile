FROM ubuntu:18.04
MAINTAINER Nguyen Dinh Bien <bien.uet279@gmail.com>

RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  wget \
  dialog \
  openssh-client \
  software-properties-common \
  dnsmasq \
  dnsutils \
  net-tools \
  sudo \
  rsyslog \
  unzip \
  unrar \
  locales \
  resolvconf \
  iproute2

RUN ln -s -f /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime

VOLUME ["/opt/zimbra"]

EXPOSE 25 80 465 587 110 143 993 995 443 3443 9071

COPY opt /opt/

CMD ["/bin/bash", "/opt/build.sh", "-d"]
