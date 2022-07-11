#!/usr/bin/env bash

. .config

printf "\n"

echo "Остановка сервисов"

for serv in ${services[@]}; do
  
  printf " - остановка $serv ... "
  docker service scale $serv=0 1> /dev/null
  printf "OK\n"

done

printf "\n"