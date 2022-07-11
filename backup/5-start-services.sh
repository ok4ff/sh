#!/usr/bin/env bash

. backup.conf

printf "\n"

echo "[$(date +"%H:%M:%S %d.%m.%Y")] Запуск сервисов"

for serv in ${stoppedServices[@]}; do
  
  printf "[$(date +"%H:%M:%S %d.%m.%Y")]  - запуск $serv ... "
  docker service scale $serv=1 1> /dev/null
  printf "OK\n"

done

printf "\n"