
#
#
#
#

# source image
FROM docker.gf.com.cn/gf-ubuntu
# author
MAINTAINER lihuafeng <lihuafeng@gf.com.cn>
#source.list
#163
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list

# vim
# tools
RUN apt-get update && apt-get install -y libtool
RUN apt-get install -y curl
RUN apt-get install -y unzip
RUN apt-get install -y build-essential
RUN apt-get install -y pkg-config
RUN apt-get install -y automake
RUN apt-get install -y autoconf
# ssh
RUN mkdir /var/run/sshd -p
 
#java 
RUN mkdir /usr/local/java -p
ADD ./software/jdk*.gz /usr/local/java
ENV JAVA_HOME /usr/local/java/jdk1.7.0_25
ENV PATH $JAVA_HOME/bin:$PATH
RUN echo "export JAVA_HOME=$JAVA_HOME" >> /etc/profile
RUN echo "export PATH=$PATH" >> /etc/profile


# tomcat
RUN mkdir /opt/tomcat -p
ADD ./software/apache-tomcat /opt/tomcat/


EXPOSE 22
WORKDIR /opt
#
CMD /usr/sbin/sshd && tail -f /etc/hosts

