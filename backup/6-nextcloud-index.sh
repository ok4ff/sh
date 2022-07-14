#!/usr/bin/env bash

. backup.conf

printf "\n"

printf "[$(date +"%d.%m.%Y %H:%M:%S")] Выполнение nexcloud cron для сервиса ${nextcloudServiceName} ... "
/usr/bin/docker exec -i -u 33:33 $(/usr/bin/docker ps -q -f name=${nextcloudServiceName}) php occ files:scan ${nextcloudUsername}
printf "Ок\n"

printf "\n"