#!/usr/bin/env bash

romans=('1,I' '4,IV' '5,V' '9,IX' '10,X' '40,XL' \
    '50,L' '90,XC' '100,C' '400,CD' '500,D' '900,CM' '1000,M')

dec2Roman() (
    [ $1 -le 0 ] && echo "" && return
    [ $1 -le 1 ] && echo "I" && return

    for i in ${romans[@]};
    do
        num=${i%,*}
        if [ $1 -lt $num ]; then
            break
        fi
        sub=$num
        sym=${i#*,}
    done
    echo ${sym}$(dec2Roman $(( $1 - $sub )))
)

[ -z $1 ] && echo "number required" && exit || echo "$(dec2Roman $1)"
