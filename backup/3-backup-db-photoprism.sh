#!/usr/bin/env bash

# BACKUP:
# photoprism backup -i [filename]
# 
# RESTORE:
# photoprism restore -i [filename-to-your-sql-dump]

folderArg=$1

if [[ $folderArg == "" ]]
then
   echo "Не указан параметр периодичности запуска!"
   exit 1
fi

. backup.conf

printf "\n"

echo "[$(date +"%d.%m.%Y %H:%M:%S")] Резервное копирование базы photoprism)"
echo "[$(date +"%d.%m.%Y %H:%M:%S")] Директория: $dirBackupDB/$folderArg"

printf "[$(date +"%d.%m.%Y %H:%M:%S")]  - $photoprismServiceName ... "

mkdir -p $dirBackupDB/$folderArg/$photoprismServiceName
filename=dump_$(date +"%Y-%m-%d_%H_%M_%S").gz
filepath=${dirBackupDB}/$folderArg/${photoprismServiceName}/$filename
/usr/bin/docker exec -i $(/usr/bin/docker ps -q -f name=${photoprismServiceName}) photoprism backup -i | gzip > ${filepath}
printf "добавлен файл $filename\n"

printf "\n"