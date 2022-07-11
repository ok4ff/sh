#!/usr/bin/env bash

. backup.conf

printf "\n"

echo "Остановка сервисов $(date +"%H:%M:%S %d.%m.%Y")"

for serv in ${stoppedServices[@]}; do
  
  printf " - остановка $serv ... "
  docker service scale $serv=0 1> /dev/null
  printf "OK $(date +"%H:%M:%S %d.%m.%Y") \n"

done

printf "\n"