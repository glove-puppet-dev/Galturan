# Процесс разработки

## Требования

- `mise`
- Git с поддержкой подмодулей
- Node.js и npm
- Hugo, закрепленный через `mise.toml`

Проект закреплен на Hugo 0.160.1:

```sh
mise exec -- hugo version
```

Ожидаемый вывод должен содержать:

```text
hugo v0.160.1
```

## Первичная настройка

Установить закрепленные версии инструментов:

```sh
mise install
npm install
```

Инициализировать тему PaperMod:

```sh
git submodule update --init --recursive
```

## Локальный сервер

Запускайте локальный сервер из памяти, чтобы не создавать `public/` и `.hugo_build.lock` в корне проекта:

```sh
mise exec -- hugo server --bind 127.0.0.1 --port 1313 --disableFastRender --renderToMemory --noBuildLock
```

Открыть:

```text
http://localhost:1313/
```

Если меняются Tailwind-классы, design tokens или проектные стили, параллельно запустить:

```sh
npm run tw:watch
```

Редактируемый CSS source находится в `assets/tailwind/input.css`. Файл `assets/css/extended/custom.css` генерируется Tailwind CLI и не редактируется вручную.

## Продакшен-сборка

Собрать сайт с минификацией:

```sh
npm run build:local
```

Проверочная чистая сборка вне репозитория:

```sh
npm run tw:build
mise exec -- hugo --minify --noBuildLock --destination /private/tmp/galturan-hugo-build --cleanDestinationDir
```

## Полезные проверки

Проверить итоговую конфигурацию Hugo:

```sh
mise exec -- hugo config --format yaml
```

Найти устаревшие языковые поля Hugo:

```sh
rg "LanguageDirection|LanguageCode|languageCode" .
```

Посмотреть измененные файлы:

```sh
git status --short --ignored
```

## Рабочие правила

- Не редактировать `themes/PaperMod/` напрямую.
- Не редактировать `assets/css/extended/custom.css` вручную; менять `assets/tailwind/input.css`.
- Проектные изменения держать в `layouts/`, `assets/`, `content/`, `static/` или `hugo.yaml`.
- Основные шаблоны проекта должны переопределяться в корневом `layouts/`, а не внутри темы.
- Публичный контент сайта и UI-тексты держать на английском языке.
- Проектную документацию держать на русском языке.
- Не коммитить сгенерированные файлы сборки.
- В Markdown-файлах использовать YAML front matter.
