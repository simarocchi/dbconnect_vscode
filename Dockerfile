FROM ubuntu:18.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y \
    wget \
    gcc \
    g++ \
    build-essential \
    curl \
    git

#Install Java Openjdk
RUN apt install -y openjdk-8-jdk openjdk-8-jre

# Install Python 3.7
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN DEBIAN_FRONTEND="noninteractive" apt install -y python3.7-dev \
    python3.7-full 

RUN python3.7 --version
RUN python3.7 -m ensurepip


RUN pip3.7 install --upgrade pip

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

RUN java -version

#uninstall spark 
RUN pip3.7 uninstall pyspark

#install 
RUN pip3.7 install -U "databricks-connect==7.3.*" 

ENV SPARK_HOME=/usr/local/lib/python3.7/dist-packages/pyspark
