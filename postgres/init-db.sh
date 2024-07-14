#!/bin/bash

PGUSER=${POSTGRES_USER}
PGPASSWORD=${POSTGRES_PASSWORD}
DATABASE=${POSTGRES_DB}

# Подключаемся к базе данных postgres и выполняем скрипт
psql -v ON_ERROR_STOP=1 --username "$PGUSER" --dbname "postgres" <<-EOSQL
    -- Создаем пользователя, если его нет
    DO
    \$\$
    BEGIN
        IF NOT EXISTS (
            SELECT
            FROM   pg_catalog.pg_roles
            WHERE  rolname = '$PGUSER') THEN
            CREATE ROLE $PGUSER WITH LOGIN PASSWORD '$PGPASSWORD';
        END IF;
    END
    \$\$;

    -- Создаем базу данных, если ее нет
    DO
    \$\$
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = '$DATABASE') THEN
            CREATE DATABASE $DATABASE;
        END IF;
    END
    \$\$;

    -- Присваиваем права пользователю на базу данных
    GRANT ALL PRIVILEGES ON DATABASE $DATABASE TO $PGUSER;
EOSQL

echo "База данных $DATABASE и пользователь $PGUSER инициализированы успешно."