#!/bin/bash

set -e

echo "INFO: STARTING: Installing JAVA 1.7.0_45 from local package"

sudo mkdir /opt/jdk
sudo tar -zxf ./artifacts/jdk-7u45-linux-x64.gz -C /opt/jdk
sudo /usr/sbin/update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.7.0_45/bin/java 1100
sudo /usr/sbin/update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.7.0_45/bin/javac 1100
echo "export JAVA_HOME=/opt/jdk/jdk1.7.0_45">>~/.bashrc

echo "INFO: FINISHED: Installing JAVA 1.7.0_45 from local package"