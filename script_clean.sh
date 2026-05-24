#!/bin/bash

# Назначение:
#   Очистить локальные артефакты Hugo-сборки.
#
# Когда использовать:
#   - если локальная сборка ведет себя странно из-за старого public/ или resources/;
#   - перед чистой локальной сборкой;
#   - перед проверкой рабочего дерева.
#
# Как использовать:
#   ./script_clean.sh
#
# Что делает:
#   Удаляет только файлы и папки, которые генерируются Hugo и игнорируются Git.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Cleaning Hugo build artifacts"

rm -rf public public-dev resources .hugo_build.lock hugo_stats.json

echo "Done"
