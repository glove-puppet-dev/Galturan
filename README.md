# Galkynys LLC

Корпоративный сайт Galkynys LLC на Hugo для компании из Туркменистана, которая работает как full-cycle market-entry platform: импорт, логистика, compliance, дистрибуция, retail access, brand development и B2B/B2G procurement.

## Стек

- Hugo 0.160.1
- Тема PaperMod как подмодуль Git
- Основная конфигурация проекта в `hugo.yaml`
- Кастомные шаблоны в `layouts/`
- Кастомные стили в `assets/css/extended/`

## Быстрый старт

Установить или активировать закрепленные версии инструментов:

```sh
mise install
```

Инициализировать подмодуль с темой, если он еще не загружен:

```sh
git submodule update --init --recursive
```

Запустить локальный сервер из памяти:

```sh
mise exec -- hugo server --bind 127.0.0.1 --port 1313 --disableFastRender --renderToMemory --noBuildLock
```

Собрать сайт:

```sh
mise exec -- hugo --minify
```

Локальное превью доступно по адресу <http://localhost:1313/>.

## Документация

- [Обзор проекта](docs/project-overview.md)
- [Архитектура](docs/architecture.md)
- [Процесс разработки](docs/development.md)
- [Контент-гайд](docs/content-guide.md)
- [UI-матрица](docs/ui-matrix.md)
- [Деплой](docs/deployment.md)

## Структура

```text
archetypes/          Шаблоны для создания контента
assets/              Ресурсы Hugo Pipes и расширения темы
content/             Контент сайта и страницы разделов
data/                Файлы данных
i18n/                Файлы переводов
layouts/             Переопределения шаблонов проекта
static/              Статические файлы, копируемые без обработки
themes/PaperMod/     Тема PaperMod как подмодуль Git
hugo.yaml            Конфигурация Hugo
mise.toml            Закрепленная версия Hugo
```

Сгенерированные файлы, например `public/`, `resources/_gen/` и `.hugo_build.lock`, игнорируются и не должны попадать в коммиты.
