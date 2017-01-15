# Building up Docker file for master thesis framework

FROM phusion/baseimage:latest
FROM python:2-onbuild

MAINTAINER Martin Kraemer <info@martin-kraemer.net>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -y install apt-utils && \
  apt-get install -y dnsmasq hostapd iptables python supervisor mysql-server \
		unzip default-jdk nano lib32stdc++6 lib32z1

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD setup-database.sh /setup-database.sh
ADD hotspot.sh /hotspot.sh
ADD run.sh /run.sh

RUN chmod 755 /*.sh

# Remove pre-installed database
RUN rm -rf /var/lib/mysql

# Add volumes for the app and MySql
VOLUME  ["/var/mH-PriSe/mysql", "/var/lib/mysql"]
VOLUME  ["/home/martin/repos/docker-mhPrise/mH-PriSe", "/usr/src/app/framework"]
VOLUME  ["/home/martin/repos/docker-mhPrise/conf", "/usr/src/app/config"]


## setup matplot lib
# basemap
ENV MLP_URL https://github.com/matplotlib/basemap/archive/v1.0.7rel.tar.gz
RUN curl -L ${MLP_URL} | tar xz -C /usr/local
ENV GEOS_DIR /usr/local/
RUN cd /usr/local/basemap-1.0.7rel/geos-3.3.3/ && ./configure --prefix=$GEOS_DIR && make; make install
RUN cd /usr/local/basemap-1.0.7rel/ && python setup.py install


## install android
ENV ANDROID_URL https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
RUN wget -q ${ANDROID_URL}
RUN unzip tools_r25.2.3-linux.zip -d /usr/local/android/
ENV ANDROID_HOME /usr/local/android

ENV ANDROID_SDK_COMPONENTS platform-tools,build-tools-23.0.3
RUN echo y | ${ANDROID_HOME}/tools/android update sdk --no-ui --all --filter "${ANDROID_SDK_COMPONENTS}"

ENV PATH $PATH:${ANDROID_HOME}/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/23.0.3



CMD ["/run.sh"]

EXPOSE 3306
