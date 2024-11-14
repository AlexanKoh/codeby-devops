#!/bin/bash

# Генерация SSH-ключа для пользователя vagrant, если он ещё не создан
if [ ! -f /home/vagrant/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""
fi

# Установка sshpass для автоматической передачи пароля
apt-get update
apt-get install -y sshpass

# Копирование публичного ключа на сервер
sshpass -p "vagrant" ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub -o StrictHostKeyChecking=no vagrant@server

