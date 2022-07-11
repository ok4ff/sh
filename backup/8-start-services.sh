#!/usr/bin/env bash

. docker.conf

printf "\n"

echo "Запуск сервисов"

for serv in ${services[@]}; do
  
  printf " - запуск $serv ... "
  docker service scale $serv=1 1> /dev/null
  printf "OK\n"

done

printf "\n"