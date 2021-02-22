#!/usr/bin/env bash

numword=('zero' 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine' 'ten')
one=('' 'eleven' 'twelve' 'thirteen' 'fourteen' 'fifteen' 'sixteen' 'seventeen' 'eighteen' 'nineteen')
tens=('' 'twenty' 'thirty' 'fourty' 'fifty' 'sixety' 'seventy' 'eighty' 'ninety')
pos=('hundred' 'thousand' 'million' 'billion' 'trillion')

digitStr() {
    while read number; do
        [ "$number" -le 10 ] && [ "$number" -ge 0 ] && echo "${numword[$number]}" && break # 0-9
        [ "$number" -lt 20 ] && [ "$number" -ge 11 ] && echo "${one[${number:1:1}]}" && break # 11-19
        [ "$number" -lt 100 ] && [ "$number" -ge 20 ] && echo "${tens[$(( ${number:0:1}-1))]} " && [ ${number:1:1} -ne 0 ] && echo ${numword[${number:1:1}]}
    done
}

combine(){
    num=$1
    [ $num -gt 99 ] && wrd="$(echo ${num:0:1} | digitStr ) hundred"&& num="${num:1}"
    wrd="${wrd} $(echo $num | digitStr )"
    [ $2 -ne 0 ] && wrd="${wrd} ${pos[$2]}"
    echo $wrd
}

_ () {
    tempNum=$1
    tensPlace=0
    len=${#1}
    while [ $len -gt 0 ]; do
        if [ $len -ge 3 ]; then
            v="${tempNum: $(( $len - 3 )): 3}" # slice the last 3 digits
            tempNum=${tempNum: 0: $(( $len - 3 ))} # slice string
            len=${#tempNum}
        else
            v=$tempNum
            len=0
        fi
        str="$(combine $v $tensPlace) ${str}"
        (( tensPlace+=1 ))
    done
    echo $str
}

[ ${#1} -eq 1 ] && echo ${numword[$1]} || _ $1
