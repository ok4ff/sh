#!/usr/bin/env bash

. docker.conf

printf "\n"

echo "Остановка сервисов"

for serv in ${stoppedServices[@]}; do
  
  printf " - остановка $serv ... "
  docker service scale $serv=0 1> /dev/null
  printf "OK\n"

done

printf "\n"