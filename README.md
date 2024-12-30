# Dokploy - install scripts

> Перед работой просьба ознакомиться с [README - dokploy](https://github.com/dokploy/dokploy)

Этот проект содержит несколько скриптов, которые являются немного изменённой версией оригинала, устанавливаемого с помощью следующей команды:

```bash
curl -sSL https://dokploy.com/install.sh | sh
```

## Список скриптов

- [fix/install.sh](fix/install.sh) - используется ifconfig.me для получения IP-адреса (служит базовым скриптом для написания остальных)
- [private/install.sh](private/install.sh) - установка dokploy без открытия 3000 порта под панель управления
- [private/proxy.sh](private/proxy.sh) - запускает прокси-сервер с публичным портом для первичной настройки панели управления
- [install.sh](install.sh) - однофайловая версия с последовательным запуском сценариев (private)
