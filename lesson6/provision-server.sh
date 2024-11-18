#!/bin/bash

# Настройка SSH-директории и файла для авторизованных ключей
mkdir -p /home/vagrant/.ssh
touch /home/vagrant/.ssh/authorized_keys

# Устанавливаем правильные права
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys

