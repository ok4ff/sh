#!/usr/bin/env bash

. backup.conf

printf "\n"

echo "[$(date +"%H:%M:%S %d.%m.%Y")] Остановка сервисов"

for serv in ${stoppedServices[@]}; do
  
  printf "[$(date +"%H:%M:%S %d.%m.%Y")] - остановка $serv ... "
  docker service scale $serv=0 1> /dev/null
  printf "OK\n"

done

printf "\n"