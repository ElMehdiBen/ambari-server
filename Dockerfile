FROM centos:7.6.1810

RUN yum update -y

COPY ./ambari-server.exp ./ambari-server.exp
WORKDIR /
#RUN yum install -y ntp
#RUN systemctl enable ntpd
#RUN systemctl disable firewalld
#RUN service firewalld stop
#RUN setenforce 0
#RUN umask 0022
#RUN echo umask 0022 >> /etc/profile
RUN yum install wget -y
RUN wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.7.4.0/ambari.repo -O /etc/yum.repos.d/ambari.repo
RUN yum clean all
RUN yum install ambari-server -y
RUN yum install mysql-connector-java -y
RUN yum install expect -y
RUN expect ambari-server.exp
EXPOSE 8080
CMD ambari-server start
