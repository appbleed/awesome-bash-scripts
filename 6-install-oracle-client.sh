#!/bin/bash

set -e

echo "INFO: STARTING: Create oracle user"

echo Checking oracle user/groups
# check if we need to create a dba group
grep dba /etc/group > /dev/null 2>&1
if [ $? -ne 0 ]; then
  #the group doesn't exist, create it
  echo "  Adding dba group"
  groupadd -g 500 dba
fi

# check if we need to create a oinstall group
grep oinstall /etc/group > /dev/null 2>&1
if [ $? -ne 0 ]; then
  #the group doesn't exist, create it
  echo "  Adding oinstall group"
  groupadd -g 501 oinstall
fi

# check if we need to create an oracle user
grep oracle /etc/passwd > /dev/null 2>&1
if [ $? -ne 0 ]; then
  #the user doesn't exist, create it
  echo "  Adding oracle user"
  useradd -c "Oracle user" -m -u 500 -g 500 -G oinstall oracle
fi

echo "INFO: FINISHED: Create oracle user"

echo "INFO: STARTING: Installing Oracle Instant Client and setup tnsnames"

sudo mkdir /opt/oracle
sudo tar -zxf ./artifacts/instantclient.tar.gz -C /opt/oracle

echo "export ORACLE_HOME=/opt/oracle/instantclient_11_2">>~/.bashrc
echo 'export PATH="/opt/oracle/instantclient_11_2:$PATH"'>>~/.bashrc
echo "export LD_LIBRARY_PATH=/opt/oracle/instantclient_11_2">>~/.bashrc
echo "export TNS_ADMIN=/home/oracle">>~/.bashrc
echo "export NLS_LANG=AMERICAN_AMERICA.AL32UTF8">>~/.bashrc

sudo cp ./artifacts/tnsnames.ora /home/oracle/tnsnames.ora

# TODO: Add logic to update tnsnames.ora file

echo "INFO: FINISHED: Installing Oracle Instant Client and setup tnsnames"