#!/bin/bash

# 1) 원격 접속 백업 수행 -> auto_telnet.sh(tar CMD)
# # tar CMD: tar czf /tmp/home_$(hostname).tar.gz /home
# 2) 파일 전송 -> auto_ftp.sh

# 1) 원격 접속 백업 수행 -> auto_telnet.sh(tar CMD)
# # tar CMD: tar czf /tmp/home_$(hostname).tar.gz /home
SERVERLIST='/root/bin/server_ftp.txt'
cat $SERVERLIST | while read IP
do
    # echo $IP
    BACKUPFILE="home_${IP1}_$(date +%m%d_%H%M%S).tar.gz"
    CmdBackup() {
        sleep 2; echo 'root'
        sleep 0.3; echo 'soldesk1.'
        sleep 0.3; echo "tar czf /tmp/$BACKUPFILE /home"
        sleep 0.3; echo 'exit'
    }
    CmdBackup | telnet $IP

# 2) 파일 전송 -> auto_ftp.sh
    UNAME='root'
    UPASS='soldesk1.'
    ftp -n $IP << EOF
    user $UNAME $UPASS
    cd /tmp
    lcd /test
    bin
    hash
    prompt
    mget $BACKUPFILE
    quit
EOF
done
