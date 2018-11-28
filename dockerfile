FROM alpine:3.7


ENV JAVA_HOME=/opt/jdk \
    PATH=${PATH}:/opt/jdk/bin \
    LANG=C.UTF-8

RUN set -ex && \
    apk add --no-cache bash && \
    wget https://download.java.net/java/early_access/alpine/11/binaries/openjdk-11-ea+11_linux-x64-musl_bin.tar.gz -O jdk.tar.gz && \
    mkdir -p /opt/jdk && \
    tar zxvf jdk.tar.gz -C /opt/jdk --strip-components=1 && \
    rm jdk.tar.gz && \
    rm /opt/jdk/lib/src.zip

WORKDIR /app

COPY target/RampUpTest-1.0-SNAPSHOT.jar RampUpTest-1.0-SNAPSHOT.jar


CMD java -jar RampUpTest-1.0-SNAPSHOT.jar
