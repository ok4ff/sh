#!/usr/bin/env bash

. backup.conf

printf "\n"

echo "Запуск сервисов $(date +"%H:%M:%S %d.%m.%Y")"

for serv in ${stoppedServices[@]}; do
  
  printf " - запуск $serv ... "
  docker service scale $serv=1 1> /dev/null
  printf "OK $(date +"%H:%M:%S %d.%m.%Y")\n"

done

printf "\n"