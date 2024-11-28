#!/bin/bash

# Создает папку myfolder в домашней директории текущего пользователя, если она не существует
FOLDER="$HOME/myfolder"
mkdir -p "$FOLDER"

# Создает 5 файлов в папке
FILE1="$FOLDER/file1.txt"
FILE2="$FOLDER/file2.txt"
FILE3="$FOLDER/file3.txt"
FILE4="$FOLDER/file4.txt"
FILE5="$FOLDER/file5.txt"

# 1. Файл с приветствием и текущей датой
echo -e "Приветствие!\n$(date)" > "$FILE1"

# 2. Пустой файл с правами 777
touch "$FILE2"
chmod 777 "$FILE2"

# 3. Файл с одной строкой длиной в 20 случайных символов
echo "$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20)" > "$FILE3"

# 4 и 5. Пустые файлы
touch "$FILE4" "$FILE5"

echo "Скрипт script1.sh выполнен успешно."
