# UI-матрица Galkynysh LLC

Матрица фиксирует фактическую UI-систему текущей версии проекта Galkynysh LLC.

Текущий стек:

- Hugo 0.160.1
- PaperMod как подмодуль Git
- Netlify
- mise
- англоязычный Markdown-контент в `content/`
- проектные overrides в `layouts/`
- корпоративные стили в `assets/css/extended/galkynysh.css`

В проекте сейчас нет Node.js, Tailwind CSS, PostgreSQL, Netlify Functions и `data/entities.yaml`. Эти элементы можно добавлять позже, но они не считаются частью текущей реализации.

## 1. Базовые UI-принципы

| Принцип | Решение | Где закреплено |
| --- | --- | --- |
| Static-first | Сайт собирается как статический Hugo-сайт. | `hugo.yaml`, `layouts/`, `content/` |
| B2B вместо e-commerce | Не использовать корзину, скидки, цены и retail-паттерны. | Контент, меню, CTA |
| Single-language English | Публичный сайт ведется только на английском языке. | `content/`, `layouts/`, `hugo.yaml` |
| PaperMod как основа | Тема не редактируется напрямую. | `themes/PaperMod/`, overrides в `layouts/` |
| Corporate placeholder | Заглушка должна выглядеть как серьезный B2B-сайт, а не как пустой шаблон. | Главная, внутренние страницы, стили |
| Простая поддержка | Все правки должны быть понятны без отдельного frontend toolchain. | Hugo templates, CSS, Markdown |

## 2. Информационная архитектура

| Раздел | Назначение | CTA |
| --- | --- | --- |
| Home | Объяснить позиционирование Galkynysh LLC как full-cycle market-entry platform для Туркменистана. | `Become a Partner` |
| Company | Дать базовое доверие и объяснить роль компании. | Перейти к контактам |
| Capabilities | Показать market entry, import, logistics, compliance, sales execution, procurement и finance support. | Review capabilities |
| Categories | Показать направления товаров без превращения сайта в каталог. | Обсудить категорию |
| Brands | Дополнительная страница для brand launch и brand development; не входит в главное меню. | Предложить бренд |
| Distribution | Показать integrated route-to-market и локальные каналы продаж. | Обсудить дистрибуцию |
| For Suppliers | Основная страница для международных поставщиков. | Become a Partner |
| Procurement | Описать B2B, institutional и public-sector procurement. | Обсудить procurement |
| Logistics | Описать импорт, складирование, документы и доставку. | Запросить поддержку |
| News | Резервная страница для будущих новостей; не входит в главное меню. | Читать новости |
| Contacts | Завершить конверсию и принять запрос. | Отправить запрос |

## 3. Шаблоны

| Тип | Шаблон | Статус |
| --- | --- | --- |
| Базовый HTML | `layouts/baseof.html` | Реализован |
| Head/meta | `layouts/partials/head.html` | Реализован |
| Главная | `layouts/index.html` | Реализован |
| Разделы | `layouts/_default/list.html` | Реализован |
| Обычные страницы | `layouts/_default/single.html` | Реализован |
| RSS | `layouts/_default/rss.xml` | Реализован |
| 404 | `layouts/404.html` | Реализован |
| Header | `layouts/partials/header.html` | Реализован |
| Footer | `layouts/partials/footer.html` | Реализован |
| Breadcrumbs | `layouts/partials/breadcrumbs.html` | Реализован |
| Open Graph | `layouts/partials/opengraph.html` | Реализован |

## 4. Компоненты

| Компонент | Назначение | Реализация |
| --- | --- | --- |
| Header | Навигация и основной CTA. | `layouts/partials/header.html` |
| Footer | Вторичная навигация и copyright. | `layouts/partials/footer.html` |
| Breadcrumbs | Ориентация на внутренних страницах. | `layouts/partials/breadcrumbs.html` |
| Home hero | Первый экран с позиционированием. | `layouts/index.html` |
| Key facts | Четыре факта из контентной концепции. | `layouts/index.html`, CSS |
| Story grid | Пояснение commercial platform. | `layouts/index.html`, CSS |
| Category cards | Быстрое сканирование направлений. | `layouts/index.html`, CSS |
| Route steps | Восемь шагов route-to-market. | `layouts/index.html`, CSS |
| Capability groups | Четыре группы возможностей. | `layouts/index.html`, Markdown и CSS |
| Page hero | Заголовок и описание внутренних страниц. | `layouts/_default/list.html`, `layouts/_default/single.html` |
| CTA buttons | Переход к контактам и поставщикам. | CSS-классы `.button`, `.button-primary`, `.button-secondary` |

## 5. Визуальные токены

| Токен | Значение |
| --- | --- |
| Контентная ширина | `760px` |
| Рабочая ширина | `1060px` |
| Широкая сетка | `1180px` |
| Радиус | `8px` |
| Основной текст | Глубокий зеленовато-черный |
| Вторичный текст | Серо-зеленый |
| Accent | Темный зеленый |
| Gold accent | Сдержанный золотой |
| Surface | Светлый теплый фон |
| Border | Светлая холодная линия |

Все токены находятся в `assets/css/extended/galkynysh.css`.

## 6. Responsive-матрица

| Viewport | Правило |
| --- | --- |
| 360-479 | Одна колонка, CTA не должен обрезаться, горизонтального overflow быть не должно. |
| 480-767 | Одна колонка, карточки и process-блоки складываются вертикально. |
| 768-1023 | Допустимы две колонки для карточек и списков. |
| 1024-1279 | Основной desktop layout. |
| 1280+ | Контент ограничен container-шириной, текст не растягивается по всей ширине. |

## 7. SEO и metadata

| Элемент | Текущий статус |
| --- | --- |
| `title` | Настроен через Hugo и front matter. |
| `description` | Настроен в `hugo.yaml` и `_index.md` страниц. |
| Canonical | Генерируется в `layouts/partials/head.html`. |
| Open Graph | Генерируется через `layouts/partials/opengraph.html`. |
| Twitter cards | Используется partial PaperMod. |
| Organization JSON-LD | Используется schema partial PaperMod. |
| BreadcrumbList JSON-LD | Используется schema partial PaperMod. |

Централизованный JSON-LD graph пока не реализован и не должен упоминаться как текущая функциональность.

## 8. QA-матрица

| Проверка | Команда/инструмент | Критерий |
| --- | --- | --- |
| Hugo build | `mise exec -- hugo --minify` | Сборка без ошибок и deprecated warnings. |
| Версия Hugo | `mise exec -- hugo version` | Hugo 0.160.1. |
| Чистая сборка | `mise exec -- hugo --minify --noBuildLock --destination /private/tmp/galkynysh-hugo-build --cleanDestinationDir` | Output собирается вне репозитория. |
| Ссылки меню | Проверка HTML output или ручной просмотр. | Все пункты меню ведут на 200-страницы. |
| Mobile | 360, 390, 768 viewport. | Нет горизонтального overflow и наложений текста. |
| Theme edits | `git status themes/PaperMod` | Подмодуль не содержит проектных правок. |

## 9. Definition of Done для заглушки

Заглушка считается готовой, когда:

- сборка Hugo 0.160.1 проходит без warnings;
- `/categories/` является бизнес-разделом, а taxonomy `categories` отключена;
- все пункты меню открываются;
- главная объясняет full-cycle B2B/B2G market-entry позиционирование;
- внутренние страницы не выглядят как блог;
- документация на русском соответствует фактическому стеку;
- публичный сайт остается англоязычным;
- `public/`, `resources/` и `.hugo_build.lock` не коммитятся.
