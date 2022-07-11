#!/usr/bin/env bash

. .config*

printf "\n"

echo "Настройка заданий Crone"
rm -v ${dirCron}/*/*

for cron in ${min5Cron[@]}; do
  ln -s $dirScript/$cron $dirCron/5min/
  echo "enable ${crone} to 5min"
done

for cron in ${daysCron[@]}; do
  ln -s $dirScript/$cron $dirCron/day/
  echo "enable ${crone} to day"
done

for cron in ${weekCron[@]}; do
  ln -s $dirScript/$cron $dirCron/week/
  echo "enable ${crone} to week"
done

printf "\n"


