# fastify-api-application

Стартовый шаблон REST API на [Fastify](https://fastify.dev/) и TypeScript для курса
[JS: REST API (Fastify)](https://ru.hexlet.io/courses/js-rest-api).

Внутри лежит ровно то, что получается к концу урока «Подготовка проекта», то есть скелет от генератора `fastify generate`, настройки TypeScript и три команды запуска. Базы данных, контракта на TypeSpec и раннера тестов здесь нет: их добавляют уроки курса, и код к ним пишете вы.

## Как начать

Нажмите **Use this template** и склонируйте получившийся репозиторий к себе. Дальше идите по курсу, начиная с урока про базу данных, и коммитьте работу в этот же репозиторий.

```bash
make install
make dev
```

Сервер поднимается на порту 3000 и перезапускается сам после правки файлов.

```bash
curl localhost:3000
# {"root":true}
```

## Команды

```bash
make install      # поставить зависимости
make dev          # запуск с перезапуском и читаемыми логами
make start        # запуск без перезапуска
make check-types  # tsc, без вывода когда ошибок нет
make format       # oxfmt, тот же стиль кода, что в уроках курса
make format-check # проверить формат без правки
```

## Что внутри

- `src/routes/` — обработчики маршрутов, Fastify подключает их сам
- `src/plugins/` — плагины и мидлвары
- `src/app.ts` — точка входа
- `test/` — три примера от генератора на модуле `node:test`. Урок про тестирование ставит Vitest и просит эти три файла удалить, потому что Vitest их не запускает
- `tsconfig.json` — Node исполняет `.ts` сам, снимая типы, поэтому сборки в проекте нет и компилятор только проверяет типы

## Версия fastify-cli закреплена намеренно

В `dependencies` стоит ровно `fastify-cli` 8.0.0, без диапазона. В 8.0.1 два места зовут `require()` от пакетов, которые перешли на ESM (`chalk` 6 и `pkg-up` 5), и берут у них свойство, которого в пространстве имён модуля нет. Отсюда два отказа.

```console
$ npx fastify generate . --integrate --esm --lang=ts
TypeError: colors[level] is not a function   # log.js, обрывает генерацию до правки package.json

$ npm run dev
TypeError: pkgUp is not a function           # util.js, приложение не поднимается вовсе
```

Апстримная issue лежит по адресу <https://github.com/fastify/fastify-cli/issues/915>. Исправленной версии на npm пока нет. Поднимать пин можно после того, как оба отказа проверены запуском, и вместе с ним поднимается пин в уроке подготовки проекта курса «JS: REST API (Fastify)».

Готовое API целиком, собранное по мотивам курса, лежит в
[js-fastify-rest-api-example](https://github.com/hexlet-components/js-fastify-rest-api-example).
Оно нужно для сверки, заданий там нет.

---

[![Hexlet Ltd. logo](https://raw.githubusercontent.com/Hexlet/assets/master/images/hexlet_logo128.png)](https://hexlet.io/?utm_source=github&utm_medium=link&utm_campaign=fastify-api-application)

This repository is created and maintained by the team and the community of Hexlet, an educational project. [Read more about Hexlet](https://hexlet.io/?utm_source=github&utm_medium=link&utm_campaign=fastify-api-application).

See most active contributors on [hexlet-friends](https://friends.hexlet.io/).
