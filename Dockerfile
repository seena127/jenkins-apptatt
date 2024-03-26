FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN cd /home/
RUN yum update -y
RUN  yum install java-11-openjdk-devel -y
RUN  yum install git -y
ADD https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz /tmp
WORKDIR /tmp
RUN  tar -xvzf apache-maven-3.9.6-bin.tar.gz
ENV MAVEN_HOME=/tmp/apache-maven-3.9.6
ENV PATH=/tmp/apache-maven-3.9.6/bin/:$PATH
WORKDIR /tmp
RUN git clone https://github.com/seena127/jenkins-apptatt.git
WORKDIR /tmp/jenkins-apptatt
