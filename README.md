# Galturan LLC

Корпоративный сайт Galturan LLC на Hugo для компании из Туркменистана, которая работает как full-cycle market-entry platform: импорт, логистика, compliance, дистрибуция, retail access, brand development и B2B/B2G procurement.

## Стек

- Hugo 0.160.1
- Тема PaperMod как подмодуль Git
- Tailwind CSS 4.3 через CLI
- Основная конфигурация проекта в `hugo.yaml`
- Кастомные шаблоны в `layouts/`
- Tailwind source в `assets/tailwind/input.css`
- Сгенерированный CSS для PaperMod в `assets/css/extended/custom.css`

## Быстрый старт

Установить или активировать закрепленные версии инструментов:

```sh
mise install
npm install
```

Инициализировать подмодуль с темой, если он еще не загружен:

```sh
git submodule update --init --recursive
```

Запустить локальный сервер из памяти:

```sh
mise exec -- hugo server --bind 127.0.0.1 --port 1313 --disableFastRender --renderToMemory --noBuildLock
```

Если меняются Tailwind-классы или стили, в отдельном терминале запустить:

```sh
npm run tw:watch
```

Собрать сайт:

```sh
npm run build:local
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
assets/tailwind/     Tailwind source
content/             Контент сайта и страницы разделов
data/                Файлы данных
i18n/                Файлы переводов
layouts/             Переопределения шаблонов проекта
static/              Статические файлы, копируемые без обработки
themes/PaperMod/     Тема PaperMod как подмодуль Git
hugo.yaml            Конфигурация Hugo
mise.toml            Закрепленная версия Hugo
package.json         Tailwind CLI и build-скрипты
```

Сгенерированные файлы, например `public/`, `resources/_gen/` и `.hugo_build.lock`, игнорируются и не должны попадать в коммиты.
