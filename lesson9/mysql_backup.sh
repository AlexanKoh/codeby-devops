#!/bin/bash

# Устанавливаем переменную с датой для имени файла
timestamp=$(date +"%Y%m%d%H%M")
backup_dir="/opt/mysql_backup"
filename="test_db_$timestamp.sql"

# Создаем бэкап базы данных
mysqldump -u root test_db > "$backup_dir/$filename"

# Проверяем успешность бэкапа
if [ $? -eq 0 ]; then
  echo "Бэкап успешно создан: $backup_dir/$filename"

  # Синхронизируем файл бэкапа с машиной store
  rsync -avz "$backup_dir/$filename" vagrant@192.168.56.102:/opt/store/mysql/

  # Проверка успешности синхронизации
  if [ $? -eq 0 ]; then
    echo "Бэкап успешно синхронизирован с машиной store."
  else
    echo "Ошибка синхронизации с машиной store."
  fi
else
  echo "Ошибка при создании бэкапа."
fi

# Удаляем старые бэкапы, старше 30 дней
find "$backup_dir" -type f -mtime +30 -exec rm -f {} \;

