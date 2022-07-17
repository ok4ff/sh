#!/usr/bin/env bash

. backup.conf

printf "\n"

printf "[$(date +"%d.%m.%Y %H:%M:%S")] Синхронизация файлов сервиса ${nextcloudServiceName} ... "
convmv -f utf-8 -t utf-8 -r --notest --nfc ${nextcloudExternalFolder}
/usr/bin/docker exec -i -u 33:33 $(/usr/bin/docker ps -q -f name=${nextcloudServiceName}) php occ files:scan ${nextcloudUsername}
printf "Ок\n"

printf "\n"