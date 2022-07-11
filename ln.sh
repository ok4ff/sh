#!/usr/bin/env bash

. crone.conf

printf "\n"

echo "[$(date +"%H:%M:%S %d.%m.%Y")] Настройка заданий Crone"
rm -v ${dirCron}/*/*

for cron in ${min5Cron[@]}; do
  ln -s $dirScript/$cron $dirCron/5min/
  echo "[$(date +"%H:%M:%S %d.%m.%Y")] ${cron} -> 5min"
done

for cron in ${daysCron[@]}; do
  ln -s $dirScript/$cron $dirCron/day/
  echo "[$(date +"%H:%M:%S %d.%m.%Y")] ${cron} -> day"
done

for cron in ${weekCron[@]}; do
  ln -s $dirScript/$cron $dirCron/week/
  echo "[$(date +"%H:%M:%S %d.%m.%Y")] ${cron} -> week"
done

tree $dirCron

printf "\n"


