#!/usr/bin/env bash

. crone.conf

printf "\n"

echo "[$(date +"%d.%m.%Y %H:%M:%S")] Настройка заданий Crone"
rm -v ${dirCron}/*/*

for cron in ${min5Cron[@]}; do
  ln -s $dirScript/$cron $dirCron/5min/
  echo "[$(date +"%d.%m.%Y %H:%M:%S")] ${cron} -> 5min"
done

for cron in ${daysCron[@]}; do
  ln -s $dirScript/$cron $dirCron/day/
  echo "[$(date +"%d.%m.%Y %H:%M:%S")] ${cron} -> day"
done

for cron in ${weekCron[@]}; do
  ln -s $dirScript/$cron $dirCron/week/
  echo "[$(date +"%d.%m.%Y %H:%M:%S")] ${cron} -> week"
done

tree $dirCron

printf "\n"


