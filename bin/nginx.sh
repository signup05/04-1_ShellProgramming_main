#!/bin/bash
# Apache Web Server Configuration
# (a) 패키지 설치
# (b) (X)서비스 설정
# (c) 서비스 기동
# (d) (x)방화벽 등록
# (e) (x)SELINUX

. /root/bin/functions.sh

# 1) 패키지 설치
PkgInstall nginx

# 2) 서비스 기동
ServiceStart nginx