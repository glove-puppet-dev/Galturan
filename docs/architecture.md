# Архитектура

Проект является статическим сайтом на Hugo 0.160.1 и использует PaperMod как подмодуль Git. Весь проектный код находится в корневых папках Hugo и переопределяет поведение темы только там, где это необходимо.

## Верхнеуровневая структура

```text
archetypes/          Шаблоны контента для `hugo new content`
assets/              Ресурсы Hugo Pipes и расширенные стили PaperMod
content/             Markdown-контент и страницы разделов
data/                Файлы данных, сейчас папка пустая
docs/                Документация проекта
i18n/                Файлы переводов, сейчас папка пустая
layouts/             Проектные шаблоны и переопределения темы
static/              Файлы, которые копируются в опубликованный сайт без обработки
themes/PaperMod/     Тема PaperMod как подмодуль Git
hugo.yaml            Конфигурация Hugo
mise.toml            Закрепленная версия Hugo
```

## Конфигурация

Единственный конфигурационный файл Hugo в проекте: `hugo.yaml`.

Важные правила:

- Использовать `locale`, а не устаревший `languageCode`.
- Использовать `menus.main` для навигации.
- Для внутренних страниц Hugo предпочитать `pageRef`.
- Использовать `url` только для кнопок-призывов к действию или внешних ссылок.
- Весь публичный контент сайта должен быть на английском языке.
- Вся проектная документация должна быть на русском языке.

## Работа с темой

PaperMod находится в `themes/PaperMod/` как подмодуль Git. Файлы внутри темы напрямую не редактируются. Все изменения проекта добавляются через корневые переопределения:

```text
layouts/index.html
layouts/baseof.html
layouts/404.html
layouts/_default/list.html
layouts/_default/rss.xml
layouts/_default/single.html
layouts/_default/terms.html
layouts/partials/breadcrumbs.html
layouts/partials/header.html
layouts/partials/head.html
layouts/partials/footer.html
layouts/partials/opengraph.html
assets/css/extended/galkynys.css
```

## Текущие переопределения

| Файл | Назначение |
| --- | --- |
| `layouts/404.html` | Кастомная страница ошибки в корпоративном стиле. |
| `layouts/index.html` | Кастомная корпоративная главная страница вместо стандартной списочной главной PaperMod. |
| `layouts/baseof.html` | Базовый шаблон проекта: добавляет body-класс `site-home` и использует актуальные поля языка Hugo 0.160.1. |
| `layouts/_default/list.html` | Корпоративный шаблон для разделов и списковых страниц без блоговой ленты PaperMod. |
| `layouts/_default/rss.xml` | Заменяет устаревшее использование языковых полей PaperMod в RSS. |
| `layouts/_default/single.html` | Корпоративный шаблон одиночной страницы без блоговых метаданных. |
| `layouts/_default/terms.html` | Шаблон индексов таксономий в стиле проекта. |
| `layouts/partials/breadcrumbs.html` | Упрощенные хлебные крошки проекта. |
| `layouts/partials/header.html` | Корпоративная шапка проекта с меню из `hugo.yaml`. |
| `layouts/partials/head.html` | Переопределяет head-шаблон PaperMod, чтобы подключать проектный `opengraph.html` напрямую. |
| `layouts/partials/footer.html` | Заменяет стандартный footer PaperMod на footer компании. |
| `layouts/partials/opengraph.html` | Основной partial метаданных Open Graph с актуальными языковыми полями Hugo 0.160.1. |
| `assets/css/extended/galkynys.css` | Корпоративный визуальный слой, подключаемый через extended CSS hook темы PaperMod. |

## Сгенерированные файлы

Следующие файлы и папки являются артефактами сборки и не должны попадать в коммиты:

```text
public/
public-dev/
resources/_gen/
hugo_stats.json
.hugo_build.lock
```

Для локального просмотра без записи артефактов в рабочее дерево используйте `--renderToMemory --noBuildLock`.
