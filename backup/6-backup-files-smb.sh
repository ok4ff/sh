#!/usr/bin/env bash

. backup.conf

printf "\n"

echo "Синхранизация файлов Samba"
echo "Директория источник: $dirSMBFileSource"
echo "Директория получатель: $dirSMBFileBackup"

for folder in ${rsyncSMBFileFolders[@]}; do
  
  folderData=(${folder//;/ })

  printf " - rsync ${folderData[0]} ... "
  mkdir -p ${folderData[2]}
  rsync -azbh ${folderData[1]}  ${folderData[2]} 
  printf "OK\n"
  
done

printf "\n"