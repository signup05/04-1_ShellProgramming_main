#!/bin/bash

adminlist(){
cat << EOF
(관리 목록)
-------------------------------
1) 사용자 추가
2) 사용자 확인
3) 사용자 삭제
4) 종료
-------------------------------
EOF
}  

userlist() {
cat << EOF
(사용자 확인)
-------------------------------
$(awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' /etc/passwd)
-------------------------------
EOF
}

Userdel() {
    echo "(사용자 삭제)"
    echo -n "삭제할 사용자 이름? : "
    read uname

    grep -w "$uname" /etc/passwd >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        userdel -r $uname \
            && echo "[ OK ] $uname 사용자가 삭제되었습니다. " \
            || echo "[FAIL] $uname 사용자가 삭제되지 않았습니다. " 
    else
        echo "[FAIL] $uname 사용자가 없습니다."
    fi
}

Useradd() {
    echo "(사용자 추가)"
    echo -n "추가할 사용자 이름? : "
    read uname
    useradd "$uname" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "[ OK ] $uname 사용자가 추가 되었습니다."
        echo $uname | passwd --stdin $uname >/dev/null 2>&1
        echo "[ OK ] $uname 사용자 암호를 변경하였습니다."
    else
        echo "[FAIL] $uname 사용자가 추가되지 않았습니다."
    fi
}

while true
do
    echo
    adminlist
    echo -n "선택 번호? : "
    read NUM
    case $NUM in
        1) Useradd ;;
        2) userlist ;;
        3) Userdel ;;
        4) break ;;
        *) echo "[ INFO ] 잘못된 번호를 선택하였습니다." ; echo ;;
    esac
done