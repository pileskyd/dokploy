#!/bin/bash

# Создать default.conf, если его нет
if [ ! -f default.conf ]; then
    cat <<EOF > default.conf
server {
    listen 3000;
    location / {
        proxy_pass http://dokploy:3000;
    }
}
EOF
    echo "Файл default.conf создан."
else
    echo "Файл default.conf уже существует."
fi

# Запустить временный прокси-контейнер
echo "Запуск временного прокси-контейнера..."
docker run --rm -d --name temp-proxy --network dokploy-network -p 3000:3000 -v $(pwd)/default.conf:/etc/nginx/conf.d/default.conf nginx
echo "Прокси-контейнер запущен. Дождитесь ввода слова DONE для завершения."

# Ожидание ввода DONE для завершения
while true; do
    read -p "Введите 'DONE' для остановки контейнера: " input
    if [ "$input" = "DONE" ]; then
        echo "Остановка контейнера..."
        docker stop temp-proxy
        echo "Контейнер остановлен."
        break
    else
        echo "Неверный ввод. Повторите попытку."
    fi
done