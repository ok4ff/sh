#!/usr/bin/env bash

. .config*

printf "\n"

printf "Выполнение Nexcloud cron ... "
/usr/bin/docker exec -i -u 33:33 $(/usr/bin/docker ps -q -f name=${nexcloudServiceName}) php -f cron.php
printf "Ок\n"

printf "\n"