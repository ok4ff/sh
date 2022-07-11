#!/usr/bin/env bash

# BACKUP:
# docker exec -t your-db-container pg_dumpall -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
# docker exec -t your-db-container pg_dumpall -c -U postgres | gzip > ./tmp/dump_$(date +"%Y-%m-%d_%H_%M_%S").gz
#
# RESTORE:
# cat your_dump.sql | docker exec -i your-db-container psql -U postgres
# gunzip < your_dump.sql.gz | docker exec -i your-db-container psql -U your-db-user -d your-db-name

. .config

if [[ $1 == "" ]]
then
   echo "Не указан параметр периодичности запуска!"
   exit 1
fi

printf "\n"

echo "Резервное копирование баз postgres."
echo "Директория: $dirBackupPostgre"


for serv in ${postgreService[@]}; do
  
  servData=(${serv//;/ })
  
  nameService=${servData[0]}
  nameUser=${servData[1]}

  printf " - $nameService ... "

  mkdir -p $dirBackupPostgre/$nameService
  filename=dump_$(date +"%Y-%m-%d_%H_%M_%S").gz
  filepath=${dirBackupPostgre}/${nameService}/$filename
  /usr/bin/docker exec -i $(/usr/bin/docker ps -q -f name=${nameService}) pg_dumpall -c -U ${nameUser} | gzip > ${filepath}
  printf "добавлен файл $filename\n"

done

printf "\n"