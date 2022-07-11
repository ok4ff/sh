#!/usr/bin/env bash

. .config*

printf "\n"

echo "Настройка заданий Crone"
rm -v ${dirCron}/*/*

for cron in ${min5Cron[@]}; do
  ln -s $dirScript/$cron $dirCron/5min/
  echo "${cron} -> 5min"
done

for cron in ${daysCron[@]}; do
  ln -s $dirScript/$cron $dirCron/day/
  echo "${cron} -> day"
done

for cron in ${weekCron[@]}; do
  ln -s $dirScript/$cron $dirCron/week/
  echo "${cron} -> week"
done

tree $dirCron

printf "\n"


