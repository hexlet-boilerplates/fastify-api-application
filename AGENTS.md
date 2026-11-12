# AGENTS.md

REST API на Fastify и TypeScript. Приложение собирается в `src/app.ts`, маршруты лежат в `src/routes`, плагины в `src/plugins`.

## Команды

| Команда | Что делает |
| --- | --- |
| `make install` | Ставит зависимости и git-хуки |
| `make dev` | Запускает сервер с перезапуском при правках |
| `make start` | Запускает сервер |
| `make check-types` | Проверяет типы через `tsc` |
| `make format` | Форматирует код через oxfmt |
| `make format-check` | Проверяет форматирование |
| `make lint` | Проверяет Markdown, опечатки, workflow и запускает knip |

## Проверки

knip ищет неиспользуемые файлы и зависимости и только сообщает о них, решение по находкам принимает человек. Цели для тестов в `Makefile` нет. `make install` ставит git-хуки hk, перед коммитом они запускают `make format-check`, `make check-types` и `make lint`.

Перед завершением задачи запусти `make format-check`, `make check-types` и `make lint`, все три должны проходить.

## Окружение

Инструменты и их версии задаёт `mise.toml`, ставит их `mise install`.
