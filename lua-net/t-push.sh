#!/bin/ash 

runone() {
  min=$1
  sec=$(($min * 60))

  mnstr=`date +"%m"`
  dystr=`date +"%d"`
  fn=data${mnstr}${dystr}.txt

  echo
  echo ${fn}
  tail -2 ${fn} | sed -e 's/^/    /' | lua t-lua-put.lua

  echo
  echo sleep $sec mn $mnstr dy $dystr
  sleep $sec
}

while true; do
  hrstr=`date +"%H"`
  if [ $hrstr -ge 4 -a $hrstr -le 5 ]; then 
    runone 5
    runone 54
  elif [ $hrstr -ge 6 -a $hrstr -lt 8 ]; then 
    runone 59
  elif [ $hrstr -ge 9 -a $hrstr -le 10 ]; then 
    runone 14
  fi
  sleep 60
done

