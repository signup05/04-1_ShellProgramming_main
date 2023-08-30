#!/bin/bash

for name in $(egrep -v '^#|^$' /etc/vsftpd/ftpusers)
do
    echo $name
done