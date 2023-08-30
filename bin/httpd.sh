#!/bin/bash
# Apache Web Server Configuration

. /root/bin/functions.sh

# 1) 패키지 설치
PkgInstall httpd

# 2) 서비스 기동
ServiceStart httpd