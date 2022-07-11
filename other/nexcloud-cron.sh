#!/usr/bin/env bash

. docker.conf

printf "\n"

printf "Выполнение nexcloud cron для сервиса ${nextcloudServiceName} ... "
/usr/bin/docker exec -i -u 33:33 $(/usr/bin/docker ps -q -f name=${nextcloudServiceName}) php -f cron.php
printf "Ок\n"

printf "\n"