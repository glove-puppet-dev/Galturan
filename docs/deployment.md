# Деплой

Проект собирается как статический сайт Hugo. Перед Hugo-сборкой Tailwind CSS 4.3 генерирует `assets/css/extended/custom.css`.

## Команда сборки

```sh
npm run build
```

## Директория результата

Hugo записывает production-сборку в:

```text
public/
```

Папка `public/` игнорируется Git и должна генерироваться средой деплоя.

## Обязательная версия

Использовать Hugo 0.160.1 и Node.js 24 LTS, закрепленные в `mise.toml`, а также Tailwind CSS 4.3, закрепленный в `package-lock.json`.

Если платформа деплоя не использует `mise`, нужно явно указать Hugo `0.160.1` и Node.js `24` в настройках платформы.

## Подмодуль темы

PaperMod подключен как подмодуль Git. Среда деплоя должна загрузить подмодуль перед сборкой:

```sh
git submodule update --init --recursive
```

## Рекомендуемая проверка перед деплоем

Перед публикацией запустить:

```sh
npm run tw:build
mise exec -- hugo --minify --noBuildLock --destination /private/tmp/galturan-hugo-build --cleanDestinationDir
```

Сборка должна завершиться без Hugo deprecation warnings и сгенерировать 26 страниц.

## Чеклист деплоя

- `hugo.yaml` является единственным конфигурационным файлом Hugo.
- Версия Hugo: 0.160.1.
- Tailwind CSS собирается через `npm run tw:build`.
- Hugo запускается с `--cleanDestinationDir` и `--noBuildLock`, чтобы удаленные static-файлы не оставались в `public/`, а локальный `.hugo_build.lock` не появлялся после сборки.
- Подмодуль темы доступен в `themes/PaperMod/`.
- Сгенерированная папка `public/` не закоммичена.
- Весь публичный текст сайта на английском языке.
- Вся проектная документация на русском языке.
- Продакшен `baseURL`: `https://galturan.com/`.
