#!/bin/bash
MAVEN_VERSION=3.6.1
wegt http://us.mirrors.quenda.co/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
tar -zxvf apache-maven-${MAVEN_VERSION}-bin.tar.gz 