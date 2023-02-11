#!/bin/bash

. function.sh

BAR

CODE [U-28] NIS , NIS+ 점검		

cat << EOF >> $result

[양호]: NIS 서비스가 비활성화 되어 있거나, 필요 시 NIS+를 사용하는 경우

[취약]: NIS 서비스가 활성화 되어 있는 경우

EOF

BAR

service ypserv start
update-rc.d ypserv enable

service ypbind start
update-rc.d ypbind enable

service ypxfrd start
update-rc.d ypxfrd enable

service rpc.yppasswdd start
update-rc.d rpc.yppasswdd enable

service rpc.ypupdated start
update-rc.d rpc.ypupdated enable

cat $result

echo ; echo
