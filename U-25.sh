#!/bin/bash

. function.sh

BAR

CODE [U-25] NFS 접근 통제		

cat << EOF >> $result

[양호]: 불필요한 NFS 서비스를 사용하지 않거나, 불가피하게 사용 시 everyone 
공유를 제한한 경우

[취약]: 불필요한 NFS 서비스를 사용하고 있고, everyone 공유를 제한하지 않은 
경우

EOF

BAR

# NFS 서비스 시작
service nfs start

# NFS 서비스의 상태를 확인합니다
service nfs status

mount 192.168.0.100:/nfs_share /mnt/nfs

# NFS 공유에 액세스하여 NFS 공유가 올바르게 마운트되었는지 확인합니다
ls /mnt/nfs

# 문제가 있는 경우 오류 메시지를 인쇄하고 종료합니다
if [ $? -ne 0 ]; then
  INFO "NFS 서비스를 원래 상태로 복원할 수 없습니다."
else
  INFO "NFS 서비스가 성공적으로 원래 상태로 복원되었습니다."
fi

cat $result

echo ; echo
