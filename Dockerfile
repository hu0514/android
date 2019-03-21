FROM centos

ENV JAVA_HOME /usr/local/jdk1.8.0_131
ENV JRE_HOME /usr/local/jdk1.8.0_131/jre
ENV CLASS_PATH .:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin:$JRE_HOME/bin
ENV ANDROID_HOME /usr/local/android-sdk
ENV PATH $ANDROID_HOME/tools:$PATH
ENV LANG "en_US.UTF-8"

COPY ./files/jdk-8u131-linux-x64.tar.gz /mnt/
RUN \cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && yum install wget vim unzip -y \
    && cd /mnt \
    && tar zxvf jdk-8u131-linux-x64.tar.gz \
    && mv jdk1.8.0_131 /usr/local \
    && wget http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz \
    && tar zxvf android-sdk_r24.4.1-linux.tgz \
    && mv android-sdk-linux /usr/local/android-sdk \
    && echo yes|android update sdk -u --all --filter 2,8,13,49,50 \
    && yum clean all \
    && cd / \
    && rm -rf /mnt/*



