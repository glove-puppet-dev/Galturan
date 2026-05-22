# Финальная UI-матрица Galkynys

Матрица фиксирует целевую UI-систему проекта Galkynys для стека:
Hugo 0.161.0, PaperMod как git-подмодуль, Netlify, Node 24, Tailwind CSS 4, mise, англоязычный Markdown-контент в `content/`, локальные SEO/schema partials, централизованный JSON-LD graph и `data/entities.yaml`.

Цель UI: строгий B2B-сайт для доверия, локального присутствия, дистрибуции, логистики и будущей системы отзывов. Главная метрика интерфейса - быстро привести поставщика или партнера к понятному действию без ощущения интернет-магазина.

## 1. Базовые UI-принципы

| Принцип | Решение | Где закреплять |
| --- | --- | --- |
| SEO/schema-first | Каждая страница проектируется вместе с title, description, canonical, breadcrumbs и JSON-LD graph. | `layouts/_partials/_seo`, `layouts/_partials/_schema`, front matter |
| Static-first | Основной сайт работает как статический Hugo-сайт; интерактивность добавляется только там, где она нужна. | Hugo templates, Markdown, Tailwind CSS |
| B2B вместо e-commerce | Не использовать корзину, скидочные паттерны, "купить сейчас", перегруженные карточки товара. | Контент, CTA, навигация |
| Single-language English | Публичный сайт ведется на английском языке с одной URL-структурой и одной локалью. | `content/`, `hugo.yaml`, UI templates |
| PaperMod как основа | Тему не редактировать напрямую; все изменения делать через корневые overrides. | `layouts/`, `assets/`, `hugo.yaml` |
| Tailwind 4 как UI-слой | Дизайн-токены держать в CSS-first Tailwind-конфигурации и использовать компонентные классы проекта. | `assets/css/`, Tailwind entrypoint |
| Schema graph централизован | JSON-LD не размазывать по шаблонам страниц; собирать graph из partials и entity registry. | `data/entities.yaml`, `_schema/*.html` |
| Reviews-ready | Блоки отзывов проектируются заранее, но реальные Review/AggregateRating публикуются только после появления проверенных данных. | Netlify Functions, Netlify Database/PostgreSQL |

## 2. Информационная архитектура

| Зона | Назначение | UI-решение | CTA |
| --- | --- | --- | --- |
| Header | Быстрый доступ к ключевым разделам. | Логотип, основная навигация, один выделенный CTA. | `Become a Partner` |
| Home | Объяснить, кто такие Galkynys и почему им можно доверять. | Hero, trust summary, категории, процесс, логистика, отзывы после запуска, финальный CTA. | Запрос на сотрудничество |
| Company | Доверие, локальность, роль компании. | Страница с hero, фактами, принципами работы, entity-связями. | Перейти к контактам |
| Categories | Показать направления без превращения в каталог товаров. | Сетка категорий, описания, возможные рынки, без цен и корзины. | Обсудить категорию |
| Brands | Сценарии для производителей и владельцев брендов. | Карточки моделей сотрудничества, преимущества, процесс запуска бренда. | Предложить бренд |
| Distribution | Каналы и логика покрытия рынка. | Процессная схема, channel cards, operational notes. | Обсудить дистрибуцию |
| Logistics | Импорт, склад, документы, доставка. | Capability list, process cards, FAQ по операционным вопросам. | Запросить логистическую поддержку |
| For suppliers | Главная конверсионная страница для международных партнеров. | Проблема, решение, требования к запросу, форма/контакт. | Become a partner |
| News | Индекс обновлений без блогового шума. | Список новостей, фильтры по типам, NewsArticle schema. | Читать новость |
| Contacts | Завершение конверсии. | Контакты, форма, реквизиты, карта при необходимости. | Отправить запрос |
| Reviews | Будущий trust-блок после запуска базы. | Модерируемые отзывы, короткие выдержки, источник, дата. | Оставить отзыв / посмотреть отзывы |

## 3. Layout-матрица

| Тип страницы | Hugo template | Источник данных | Основные блоки | Schema.org | Статус |
| --- | --- | --- | --- | --- | --- |
| Главная | `layouts/index.html` или `layouts/_default/home.html` | `content/_index.md`, `data/entities.yaml` | Hero, value props, categories, process, logistics, reviews teaser, CTA | `WebSite`, `Organization`, `WebPage`, `BreadcrumbList` | Обязательный |
| Раздел | `layouts/_default/list.html` | `_index.md`, дочерние страницы | Page hero, intro, child cards, CTA | `CollectionPage`, `BreadcrumbList` | Обязательный |
| Обычная страница | `layouts/_default/single.html` | Markdown front matter + body | Page hero, content, related links, CTA | `WebPage` или `Article` | Обязательный |
| Новость | `layouts/news/single.html` | `content/news/*.md` | Date, article body, related news | `NewsArticle`, `BreadcrumbList` | Нужен при наполнении News |
| Таксономия | `layouts/_default/terms.html` | Hugo taxonomies | Term list, count, descriptions | `CollectionPage` | Опциональный |
| 404 | `layouts/404.html` | Static template | Краткий текст, ссылки в ключевые разделы | Без JSON-LD graph, кроме базового site graph | Обязательный |
| Поиск | Отдельный template только при необходимости | Static index | Search input, results | Без page-specific schema | Опциональный |
| Отзывы | `layouts/reviews/list.html`, `layouts/reviews/single.html` | Netlify DB/PostgreSQL после модерации | Aggregate summary, review cards, pagination | `Review`, `AggregateRating` только при реальных данных | Будущий |

## 4. Компонентная матрица

| Компонент | Назначение | UI-состояния | Реализация | SEO/A11y требования |
| --- | --- | --- | --- | --- |
| Header | Навигация и основной CTA. | Desktop, tablet wrap, mobile menu, active state. | `layouts/partials/header.html`, Tailwind component classes. | `nav[aria-label]`, `aria-current`, доступная кнопка CTA. |
| Footer | Вторичная навигация и доверие. | Обычный, компактный mobile. | `layouts/partials/footer.html`. | Ссылки на ключевые разделы, copyright, business identity. |
| Breadcrumbs | Ориентация и schema. | Home hidden, inner pages visible. | `layouts/partials/breadcrumbs.html`. | `BreadcrumbList` в JSON-LD, видимый текст. |
| Hero | Первый смысловой экран. | Home large, inner compact. | Layout templates + Markdown params. | Один `h1`, description рядом, без декоративного шума. |
| CTA button | Перевод к контакту. | Primary, secondary, disabled/loading для форм. | Tailwind component class. | Текст действия, не "learn more" в конверсионных местах. |
| Category card | Быстрое сканирование направлений. | Default, hover, focus. | Partial или reusable shortcode. | Не имитировать product card, не показывать цену. |
| Process row | Объяснить порядок работы. | 3-5 шагов, mobile stack. | Partial с data-driven шагами. | Нумерация в DOM, не только CSS. |
| Capability list | Списки возможностей. | Plain list, two-column desktop. | Markdown + prose styles или partial. | Настоящие `ul/li`, не набор div без смысла. |
| News card | Индекс новостей. | With image, without image, date. | List template. | Date machine-readable, title link. |
| Review card | Будущий social proof. | Pending, approved, featured. | Netlify Function + rendered static/dynamic block. | Не публиковать rating schema без проверенных отзывов. |
| Contact form | Захват заявок. | Idle, submitting, success, error. | Netlify Forms или Function endpoint. | Labels, validation, spam protection, privacy note. |
| FAQ | Снять операционные возражения. | Accordion только при реальной необходимости. | Markdown headings или lightweight component. | `FAQPage` schema только если FAQ виден на странице. |

## 5. Visual system

| Токен | Значение | Правило использования |
| --- | --- | --- |
| Контентная ширина | `760px` | Текстовые страницы, новости, policy. |
| Рабочая ширина | `1060px` | Стандартные секции и списки. |
| Широкая сетка | `1180px` | Главная, header, footer, карточные секции. |
| Радиус | `8px` максимум для карточек и панелей | Не делать "пухлую" consumer UI-эстетику. |
| Основной текст | Глубокий зеленовато-черный | Для заголовков и важных ссылок. |
| Muted text | Серо-зеленый | Для описаний, метаданных, вторичного текста. |
| Accent | Темный зеленый | Primary CTA, active state, важные ссылки. |
| Gold accent | Сдержанный золотой | Номера шагов, короткие kicker labels, не как доминирующий цвет. |
| Surface | Очень светлый теплый фон | Section bands, спокойные панели. |
| Border | Светлая холодная линия | Карточки, списки, разделители. |

Tailwind CSS 4 должен использовать эти токены как проектный слой, а не заменять их случайными utility-цветами. Компонентные классы допускаются для повторяемых паттернов: header, button, card, section, page hero, grid.

## 6. Responsive-матрица

| Viewport | Layout | Навигация | Карточки | Проверка |
| --- | --- | --- | --- | --- |
| 360-479 | Одна колонка, плотные отступы. | Mobile menu или перенос без горизонтального скролла. | 1 колонка. | Нет обрезанного текста, CTA видим. |
| 480-767 | Одна колонка с увеличенными отступами. | Компактная навигация. | 1 колонка, process stack. | Hero не занимает весь экран без смысла. |
| 768-1023 | 2 колонки там, где это помогает сканированию. | Header может переноситься. | 2 колонки. | Карточки равномерные, нет прыжков высоты. |
| 1024-1279 | Основной desktop. | Полная навигация. | 3-4 колонки. | Секции читаются без переполнений. |
| 1280+ | Ограниченный container, без растяжения текста. | Полная навигация. | До 6 компактных карточек только для коротких labels. | Контент не "разъезжается" по ширине. |

## 7. Single-language UI-матрица

| Область | Решение | Правило |
| --- | --- | --- |
| URL | Корневая англоязычная структура: `/company/`, `/contacts/`, `/for-suppliers/`. | Не добавлять языковые префиксы. |
| Locale | `en-US` или другой выбранный английский locale в Hugo config. | Одно значение используется для HTML `lang`, Open Graph locale и JSON-LD `inLanguage`. |
| UI-тексты | Английский в templates и Markdown. | Повторяемые labels лучше держать рядом с компонентами или в данных. |
| Markdown | `content/...` без языковых подпапок. | Структура должна оставаться простой и совпадать с меню. |
| Canonical | Canonical указывает на текущий единственный URL страницы. | Альтернативные языковые URL не нужны. |
| CTA | Английские B2B-формулировки. | `Become a Partner`, `Enter Turkmenistan Market`, `Contact Galkynys`. |

## 8. SEO/schema UI-матрица

| Сущность | Источник | Где показывается в UI | JSON-LD правило |
| --- | --- | --- | --- |
| Organization | `data/entities.yaml` | Header/footer, Company, Contacts. | Один стабильный `@id` для компании. |
| WebSite | Hugo config + entities | Глобально. | Один site-level node в graph. |
| WebPage | Front matter текущей страницы | Все страницы. | `isPartOf`, `about`, `breadcrumb`, `inLanguage`. |
| BreadcrumbList | Page hierarchy | Видимые breadcrumbs. | Генерируется из той же структуры, что UI breadcrumbs. |
| CollectionPage | Разделы и индексы. | List pages. | Использовать для category/news/reviews indexes. |
| NewsArticle | Новости. | News single. | Только для настоящих новостей с датой публикации. |
| Service | Distribution, logistics, supplier support. | Service-like страницы. | Привязывать к Organization через `provider`. |
| Review | Будущие отзывы. | Review card/detail. | Только approved reviews с автором/датой/текстом. |
| AggregateRating | Reviews summary. | Summary block. | Только если есть проверенная выборка отзывов. |

## 9. Reviews-ready матрица

| Слой | Финальное решение | Причина |
| --- | --- | --- |
| Сбор отзывов | Netlify Function принимает заявку и пишет в PostgreSQL. | Не смешивать пользовательский ввод со статическим Markdown. |
| Модерация | Статус `pending/approved/rejected`. | Нельзя публиковать неподтвержденный social proof. |
| Публикация | Approved reviews выводятся на reviews page и как teaser на главной. | Главная получает доверие без перегруза. |
| Schema | Review/AggregateRating включаются только для approved данных. | Это снижает риск manual action и schema spam. |
| UI | Короткие cards: имя/компания, страна, текст, дата, необязательный рейтинг. | B2B-аудитории важнее источник и контекст, чем декоративный рейтинг. |

## 10. QA-матрица

| Проверка | Команда/инструмент | Критерий |
| --- | --- | --- |
| Hugo build | `hugo --environment development --gc --minify` | Без ошибок шаблонов, без сломанных URL. |
| Версии | `mise exec -- hugo version`, `node --version` | Hugo 0.161.0, Node 24. |
| Lighthouse | Lighthouse | Performance, Accessibility, Best Practices, SEO не ниже 95 для ключевых страниц. |
| Unlighthouse | Unlighthouse | Нет системных SEO/a11y провалов по ключевым страницам. |
| Schema | Rich Results / schema validator | JSON-LD graph валиден, нет fake reviews. |
| Links | Link checker или Hugo output scan | Нет 404 в меню, CTA и footer-ссылках. |
| Mobile | 360, 390, 768 viewport | Нет горизонтального overflow и наложений текста. |
| No theme edits | `git status themes/PaperMod` | Подмодуль не содержит проектных правок. |

## 11. Порядок внедрения

| Этап | Что сделать | Результат |
| --- | --- | --- |
| 1 | Обновить базовые версии и конфиги: Hugo 0.161.0, Node 24, Netlify build, Tailwind 4. | Стек соответствует целевому состоянию. |
| 2 | Стабилизировать single-language структуру `content/` и меню. | Англоязычная IA без лишнего языкового слоя. |
| 3 | Вынести SEO/schema в локальные partials и `data/entities.yaml`. | Централизованный graph. |
| 4 | Пересобрать UI-компоненты поверх Tailwind 4 tokens. | Единая визуальная система без хаотичных CSS-правил. |
| 5 | Добавить page-specific templates для news, reviews и service-like страниц. | Страницы получают правильный UI и schema. |
| 6 | Подключить QA: Lighthouse, Unlighthouse, schema validation. | Матрица становится проверяемой, а не декларативной. |
| 7 | Подготовить review-систему через Netlify Functions и PostgreSQL. | Отзывы можно запускать без переделки UI. |

## 12. Definition of Done

UI считается финальным, когда:

- все публичные страницы имеют единую английскую URL-структуру, корректный canonical и HTML `lang`;
- PaperMod не редактируется напрямую;
- все повторяемые UI-паттерны имеют общий компонентный слой;
- JSON-LD собирается централизованно из Hugo partials и `data/entities.yaml`;
- отзывы не создают schema-разметку до появления проверенных данных;
- Lighthouse и Unlighthouse проходят ключевые страницы без критичных замечаний;
- документация на русском объясняет порядок поддержки UI, SEO, schema и будущих reviews.
