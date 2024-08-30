# users-api

## Как настроить

Запускаем mongodb и приложение

```shell
docker compose -f ./sharding-repl-cache/compose.yaml up --build -d
```

Настраиваем сервер конфигурации mongodb

```shell
./sharding-repl-cache/scripts/mongo-init-cfg.sh
```

Настраиваем шарды

```shell
./sharding-repl-cache/scripts/mongo-init.sh
```

Заполняем шарды данныими и проверяем шардирование

```shell
./sharding-repl-cache/scripts/mongo-check.sh
```
После выполнения скрипта данные должны распределится по шардам в соотношение 508 и 492 записи

Настраиваем кэширование

```shell
./sharding-repl-cache/scripts/redis-init.sh
```

Останавливаем 

```shell
docker compose -f ./sharding-repl-cache/compose.yaml stop
```

## Как запустить и проверить кэширование
Выполняем команду

```shell
docker compose -f ./sharding-repl-cache/compose.yaml up -d
```

Проверяем время отклика через запрос списка пользователей

http://localhost:8080/docs#/default/list_users__collection_name__users_get

Второй и все последующие запросы должны проходить значительно быстрее первого

Останавливаем 

```shell
docker compose -f ./sharding-repl-cache/compose.yaml stop
```



### Если вы запускаете проект на локальной машине


Откройте в браузере http://localhost:8080

### Если вы запускаете проект на предоставленной виртуальной машине

Узнать белый ip виртуальной машины

```shell
curl --silent http://ifconfig.me
```

Откройте в браузере http://<ip виртуальной машины>:8080

## Доступные эндпоинты

Список доступных эндпоинтов, swagger http://<ip виртуальной машины>:8080/docs