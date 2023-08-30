#!/bin/bash

IP1=192.168.0.4
PORT=1004
UNAME=user01
UPASS=user01
UPLOADFILE=main.txt
ftp -n $IP1 $PORT << EOF
user $UNAME $UPASS
cd test
lcd /test
bin
hash
prompt
mput $UPLOADFILE
quit
EOF