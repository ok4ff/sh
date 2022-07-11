#!/usr/bin/env bash

. backup.conf

printf "\n"

echo "[$(date +"%d.%m.%Y %H:%M:%S")] Остановка сервисов"

for serv in ${stoppedServices[@]}; do
  
  printf "[$(date +"%d.%m.%Y %H:%M:%S")] - остановка $serv ... "
  docker service scale $serv=0 1> /dev/null
  printf "OK\n"

done

printf "\n"