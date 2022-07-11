#!/usr/bin/env bash

. backup.conf

printf "\n"

echo "[$(date +"%d.%m.%Y %H:%M:%S")] Запуск сервисов"

for serv in ${stoppedServices[@]}; do
  
  printf "[$(date +"%d.%m.%Y %H:%M:%S")]  - запуск $serv ... "
  docker service scale $serv=1 1> /dev/null
  printf "OK\n"

done

printf "\n"