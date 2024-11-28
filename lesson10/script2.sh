#!/bin/bash

# Путь к папке myfolder
FOLDER="$HOME/myfolder"

# Проверяет, существует ли папка
if [ ! -d "$FOLDER" ]; then
  echo "Папка myfolder не существует. Скрипт завершен."
  exit 0
fi

# 1. Определяет количество файлов в папке
FILE_COUNT=$(ls -1 "$FOLDER" | wc -l)
echo "В папке $FOLDER находится $FILE_COUNT файлов."

# 2. Исправляет права второго файла с 777 на 664
FILE2="$FOLDER/file2.txt"
if [ -f "$FILE2" ]; then
  chmod 664 "$FILE2"
  echo "Права файла $FILE2 изменены на 664."
fi

# 3. Определяет пустые файлы и удаляет их
for FILE in "$FOLDER"/*; do
  if [ -f "$FILE" ] && [ ! -s "$FILE" ]; then
    rm "$FILE"
    echo "Пустой файл $FILE удален."
  fi
done

# 4. Удаляет все строки, кроме первой, в остальных файлах
for FILE in "$FOLDER"/*; do
  if [ -f "$FILE" ]; then
    sed -i '2,$d' "$FILE"
    echo "Обработан файл $FILE: оставлена только первая строка."
  fi
done

echo "Скрипт script2.sh выполнен успешно."
