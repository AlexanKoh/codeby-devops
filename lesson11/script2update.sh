#!/bin/bash

# Константы
TARGET_DIR="$HOME/myfolder"
FILE2="$TARGET_DIR/file2.txt"

# Определить количество файлов в папке
count_files() {
    if [ ! -d "$TARGET_DIR" ]; then
        echo "Ошибка: Папка $TARGET_DIR не существует."
        return 1
    fi

    FILE_COUNT=$(find "$TARGET_DIR" -type f | wc -l)
    echo "В папке $TARGET_DIR находится $FILE_COUNT файлов."
    return 0
}

# Исправить права второго файла
fix_file_permissions() {
    if [ -f "$FILE2" ]; then
        chmod 664 "$FILE2" || {
            echo "Ошибка: Не удалось изменить права $FILE2."
            return 1
        }
        echo "Права файла $FILE2 изменены на 664."
    else
        echo "Файл $FILE2 не найден."
    fi
    return 0
}

# Найти пустые файлы и удалить их
remove_empty_files() {
    EMPTY_FILES=$(find "$TARGET_DIR" -type f -empty)
    if [ -n "$EMPTY_FILES" ]; then
        echo "Удаление пустых файлов..."
        echo "$EMPTY_FILES" | xargs rm -f || {
            echo "Ошибка: Не удалось удалить пустые файлы."
            return 1
        }
        echo "Пустые файлы удалены."
    else
        echo "Пустых файлов не найдено."
    fi
    return 0
}

# Удалить все строки кроме первой в файлах
trim_files_to_first_line() {
    for FILE in "$TARGET_DIR"/*; do
        if [ -f "$FILE" ]; then
            sed -i '2,$d' "$FILE" || {
                echo "Ошибка: Не удалось обработать файл $FILE."
                return 1
            }
            echo "Файл $FILE обработан: оставлена только первая строка."
        fi
    done
    return 0
}

# Основной процесс
main() {
    count_files || exit 1
    fix_file_permissions || exit 1
    remove_empty_files || exit 1
    trim_files_to_first_line || exit 1
    echo "Скрипт script2.sh выполнен успешно."
}

main
