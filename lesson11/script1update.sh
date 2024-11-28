#!/bin/bash

# Константы
TARGET_DIR="$HOME/myfolder"   # Целевая папка
FILE1="$TARGET_DIR/file1.txt"
FILE2="$TARGET_DIR/file2.txt"
FILE3="$TARGET_DIR/file3.txt"
FILE4="$TARGET_DIR/file4.txt"
FILE5="$TARGET_DIR/file5.txt"

# Создать целевую папку, если она не существует
create_target_dir() {
    if [ ! -d "$TARGET_DIR" ]; then
        mkdir -p "$TARGET_DIR" || {
            echo "Ошибка: Не удалось создать папку $TARGET_DIR."
            return 1
        }
        echo "Папка $TARGET_DIR создана."
    else
        echo "Папка $TARGET_DIR уже существует."
    fi
}

# Создать файлы
create_files() {
    # 1. Файл с приветствием и текущей датой
    echo -e "Приветствие!\n$(date)" > "$FILE1" || {
        echo "Ошибка: Не удалось создать $FILE1."
        return 1
    }
    echo "Файл $FILE1 создан."

    # 2. Пустой файл с правами 777
    touch "$FILE2" && chmod 777 "$FILE2" || {
        echo "Ошибка: Не удалось создать $FILE2."
        return 1
    }
    echo "Файл $FILE2 создан с правами 777."

    # 3. Файл с 20 случайными символами
    RANDOM_STRING=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20)
    echo "$RANDOM_STRING" > "$FILE3" || {
        echo "Ошибка: Не удалось создать $FILE3."
        return 1
    }
    echo "Файл $FILE3 создан со случайной строкой."

    # 4 и 5. Пустые файлы
    touch "$FILE4" "$FILE5" || {
        echo "Ошибка: Не удалось создать $FILE4 и $FILE5."
        return 1
    }
    echo "Файлы $FILE4 и $FILE5 созданы."
}

# Основной процесс
main() {
    create_target_dir || exit 1
    create_files || exit 1
    echo "Скрипт script1.sh выполнен успешно."
}

main
