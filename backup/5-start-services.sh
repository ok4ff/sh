#!/usr/bin/env bash

. backup.conf

printf "\n"

echo "Запуск сервисов"

for serv in ${stoppedServices[@]}; do
  
  printf " - запуск $serv ... "
  docker service scale $serv=1 1> /dev/null
  printf "OK\n"

done

printf "\n"