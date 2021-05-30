#!/bin/zsh

# 윈도우즈에서 컴파일된 소스 파일(윈도우즈 한글인코딩:cp949) -> 맥 소스 파일(맥 한글인코딩:utf-8)
# iconv -t utf8 -f cp949 <source_win.c> source_mac.c
# -t utf8 생략 가능
FROM=cp949
TO=utf8
ICONV="iconv -t "${TO}" -f "${FROM}" "
 
# 소스파일 수만큼 반복문을 돌려서 인코딩한 타켓 파일 생성
#FILE_LIST=`find "${PWD}" -type f -name "*.[c|h]"`
#for file in "${FILE_LIST}"
for file in `find "${PWD}" -type f -name "*.[c|h]"`
do
    echo "${file}"
    `cp "${file}" "${file}".bak`
    `iconv -t utf8 -f cp949 <"${file}".bak> "${file}"`
    `rm "${file}".bak`
#    "${ICONV}" <"${file}"> "${file}"
done

#find . -type f -name "*.c" | while read file; 
#do
#    `cp "${file}" "${file}".bak`
#    `echo "${ICONV}" "${file}"`
#    `"${ICONV}" <"${file}".bak> "${file}"`
#    `rm "${file}".bak`
#done


## 내가 직접 짜다가 관둔 것
# 파일 인코딩 변경 유형코드, 파일 유형, 소스 파일 경로, 타겟 파일 경로 받는다.
#if [ "${#}" -ne 4 ]; 
#then 
#    echo "총 파라미터의 개수는 4개입니다."
#    echo "1. 유형코드(win/mac), 2, 파일 유형(.c, .js ..), 3.소스파일경로, 4.타겟파일경로 를 입력해주세요."
#    exit 0
#fi
#
#ICONV_CD="${1}"
#FILE_TYPE="${2}"
#SOURCE_FILE="${3}"/**/*."${FILE_TYPE}"
#TARGET_FILE="${4}"
#
#for file in "${SOURCE_FILE}"
#do
#    echo "${file}"
#done
#
#
#echo "${ICONV_CD}"
#echo "${FILE_TYPE}"
##echo "${SOURCE_FILE}"u

# 리눅스 iconv 명령어 문법 적용
#FROM=euc-kr
#TO=utf-8
#ICONV="iconv -c -f $FROM -t $TO "
# 
#find ./ -type f -name "*.c" | while read fn; do
#    cp ${fn} ${fn}.bak
#    echo $ICONV ${fn}
#    $ICONV < ${fn}.bak > ${fn}
#    rm ${fn}.bak
#done







