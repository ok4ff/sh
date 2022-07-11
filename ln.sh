#!/usr/bin/env bash

. .config*

printf "\n"

echo "Настройка заданий Crone"
rm -v ${dirCron}/*/*

for cron in ${min5Cron[@]}; do
  ln -s $dirScript/$cron $dirCron/5min/
  echo "Включено ${cron} Каждые 5 минут"
done

for cron in ${daysCron[@]}; do
  ln -s $dirScript/$cron $dirCron/day/
  echo "Включено ${cron} раз в день"
done

for cron in ${weekCron[@]}; do
  ln -s $dirScript/$cron $dirCron/week/
  echo "Включено ${cron} раз в неделю"
done

printf "\n"


