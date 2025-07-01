#!/bin/bash -x

# Останавливаем и удаляем старый контейнер, если он есть
docker stop nginx2025
docker rm nginx2025

# Собираем образ
docker build -t nginx-devops .

# Создаем и запускаем образ
docker run -d --name nginx2025 -p 54321:80 --restart unless-stopped nginx-devops

# Проверяем
docker ps -a
sleep 5
curl 127.0.0.1:54321
docker logs -n 15 nginx2025

