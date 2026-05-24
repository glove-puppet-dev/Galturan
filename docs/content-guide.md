# Контент-гайд

Сайт является англоязычным B2B-корпоративным сайтом. Контент должен помогать международным партнерам воспринимать Galturan LLC как full-cycle market-entry платформу для Туркменистана: supplier relations, import, logistics, compliance, distribution, brand development и B2B/B2G procurement.

## Где находится контент

| Страница | Файл |
| --- | --- |
| Метаданные главной страницы | `content/_index.md` |
| Company | `content/company/_index.md` |
| Capabilities | `content/capabilities/_index.md` |
| Categories | `content/categories/_index.md` |
| Brands | `content/brands/_index.md` |
| Distribution | `content/distribution/_index.md` |
| For Suppliers | `content/for-suppliers/_index.md` |
| Procurement | `content/procurement/_index.md` |
| Logistics | `content/logistics/_index.md` |
| News | `content/news/_index.md` |
| Contacts | `content/contacts/_index.md` |

Верстка главной страницы и большая часть текста главной сейчас находятся в `layouts/index.html`.

## Метаданные страницы

Используйте YAML front matter для метаданных страниц:

```yaml
---
title: Page Title
description: Короткое SEO-описание страницы.
---
```

Не используйте TOML front matter в новом контенте.

## Правила написания

- Использовать понятный деловой английский.
- Фокусироваться на market entry, supplier relations, импорте, compliance, дистрибуции, логистике, procurement и сотрудничестве с поставщиками.
- Писать для международных поставщиков и коммерческих партнеров.
- Избегать розничных формулировок вроде "shop now", "cart" или "best deals".
- Не добавлять неподтвержденные цифры: размер склада, количество брендов, региональное покрытие и другие показатели должны быть подтверждены бизнесом.
- Цифры, перенесенные из согласованной контентной заготовки, можно использовать в placeholder-версии, но перед production-публикацией их нужно подтвердить с бизнесом.
- Предпочитать конкретные разделы и списки длинным маркетинговым абзацам.

## Добавление нового раздела

Создать папку раздела с `_index.md`:

```text
content/example-section/_index.md
```

Добавить front matter:

```yaml
---
title: Example Section
description: Короткое описание для поиска и метаданных при публикации ссылки.
---
```

Затем добавить пункт меню в `hugo.yaml`:

```yaml
menus:
  main:
    - name: Example Section
      pageRef: /example-section
      weight: 95
```

## Обновление текста главной

Контент главной страницы находится в `layouts/index.html`. Разделы главной должны поддерживать B2B-путь конверсии:

```text
позиционирование выхода на рынок
  -> key facts и доверие к компании
  -> категории
  -> integrated route-to-market
  -> причины партнерства
  -> capabilities
  -> контактный призыв к действию
```

Визуальные стили главной находятся в `assets/css/extended/galturan.css`.
