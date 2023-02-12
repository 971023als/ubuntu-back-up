#!/bin/bash

 

. function.sh

 
TMP1=`SCRIPTNAME`.log

> $TMP1 
 

BAR

CODE [U-41] Apache 웹 서비스 영역의 분리 

cat << EOF >> $result

[양호]: DocumentRoot를 별도의 디렉터리로 지정한 경우

[취약]: DocumentRoot를 기본 디렉터리로 지정한 경우

EOF

BAR

#    백업 파일 생성
cp /etc/apache2/sites-available/000-default.conf.bak /etc/apache2/sites-available/000-default.conf



cat $result

echo ; echo
