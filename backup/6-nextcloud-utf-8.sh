#!/usr/bin/env bash

. backup.conf

printf "\n"

printf "[$(date +"%d.%m.%Y %H:%M:%S")] Нормальзация кодировки файлов ${nextcloudServiceName} ... "
convmv -f utf-8 -t utf-8 -r --notest --nfc ${nextcloudExternalFolder}
printf "Ок\n"

printf "\n"
