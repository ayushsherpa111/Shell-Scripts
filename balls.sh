#!/usr/bin/env bash

_ () {
  for i in $(seq 1 $1); do
    blkAr+='b'
    whtAr+='w'
  done
  pot="${blkAr}${whtAr}"
  while [ ${#pot} -ne 1 ]; do
    echo -n "Choose combination to remove: [bb|ww|bw] "
    read combination
    case $combination in
      "bb" | "ww")
        com="s/$combination/b/"
        pot="$( echo $pot | sed -r $com)"
        ;;
      "bw" | "wb")
        com="s/(bw|wb)/w/"
        pot="$( echo $pot | sed -r $com)"
        ;;
      *) echo "invalid combination" && exit 1;;
    esac
    echo ${pot[@]}
  done
}

[ -z "$1" ] && echo "number of balls required" && exit 2 || _ $1
