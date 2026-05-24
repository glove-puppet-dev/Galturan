#!/bin/bash

# Назначение:
#   Запустить локальный сервер Hugo для ежедневной разработки.
#
# Когда использовать:
#   - когда нужно открыть сайт локально и сразу видеть изменения в content/,
#     layouts/ и assets/;
#   - перед ручной проверкой страниц в браузере;
#   - после мягкой очистки через ./script_clean.sh.
#
# Как использовать:
#   ./script_start.sh
#
# Что делает:
#   Запускает закрепленную через mise версию Hugo 0.160.1.
#   Сервер рендерит страницы из памяти и не создает public/ и .hugo_build.lock.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Starting Hugo development server with mise"
exec mise exec -- hugo server \
  --bind 127.0.0.1 \
  --port 1313 \
  --disableFastRender \
  --renderToMemory \
  --noBuildLock
