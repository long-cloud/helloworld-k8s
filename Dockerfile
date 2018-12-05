FROM registry.longcloud.tech:96/library/centos:7.0

# 安装jdk,unzip
RUN yum makecache fast && yum install -y java-1.8.0-openjdk && yum install -y wget && yum install -y unzip && yum clean all

# 设置locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TZ=Asia/Shanghai

# 安装tomcat
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
RUN wget --cache=off  http://yum.longcloud.tech:99/release/infra/tomcat/tomcat-base-8.5.12.zip
RUN unzip tomcat-base-8.5.12.zip

# 拷贝程序包
ADD ./target/helloworld-k8s.war /opt/tomcat/webapps
RUN unzip -o -d /opt/tomcat/webapps/helloworld-k8s  helloworld-k8s.war && rm -rf helloworld-k8s.war

# 暴露8080端口
EXPOSE 8080

# 启动容器执行的命令
CMD bash /opt/apache-tomcat/bin/catalina.sh run