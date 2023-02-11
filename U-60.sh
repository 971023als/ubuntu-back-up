#!/bin/bash

 

. function.sh

  
 

BAR

CODE [U-60] ssh 원격접속 허용

cat << EOF >> $result

[양호]: 원격 접속 시 SSH 프로토콜을 사용하는 경우

[취약]: 원격 접속 시 Telnet, FTP 등 안전하지 않은 프로토콜을 사용하는 경우

EOF

BAR


TMP1=`SCRIPTNAME`.log

> $TMP1  

#  백업 파일 생성
if [ -d /etc/telnet.bak ]; then
    sudo rm -rf /etc/telnet
    sudo cp /etc/telnet.bak /etc/telnet
    sudo apt-get install telnet -y
fi

#  백업 파일 생성
if [ -d /etc/ftp.bak ]; then
    sudo rm -rf /etc/ftp
    sudo cp /etc/ftp.bak /etc/ftp
    sudo apt-get install ftp -y
fi

# Stop ssh service
sudo service ssh stop

#  백업 파일 생성
sudo rm -rf /etc/ssh
sudo cp /etc/ssh.bak /etc/ssh
sudo apt-get install openssh-server -y

cat $result

echo ; echo 
