#!/usr/bin/env bash

IS_NOT_PRIME="The number you entered is not a prime"
IS_PRIME="The number you entered is a prime"

function div_by() {
    [ $(( $1 % $2 )) -eq 0 ] && echo "$IS_NOT_PRIME"
}

function div_until() {
    upTo="$(echo $1 | awk '{ print int(sqrt($1)) }')"
    for ((i=5; i <= $upTo; i+=2)); do
        div_by $1 $i && exit 1
    done

    echo $IS_PRIME
}


[ -z $1 ] && echo 'please provide a number' && exit 1  || div_by $1 2 && exit 1 || div_by $1 3 && exit 1 || div_until $1
