#!/bin/bash

echo "🎯 Universal Figma Cleaner — знайде всі повʼязані директорії"

# Знайти всі директорії з figma у назві
figma_dirs=$(find ~/Library -type d -iname "*figma*" 2>/dev/null)

if [ -z "$figma_dirs" ]; then
  echo "❌ Figma повʼязаних директорій не знайдено."
  exit 0
fi

echo -e "\n🔍 Знайдено такі директорії:\n"
echo "$figma_dirs"

echo -e "\n⚠️ Увага: ці директорії можуть містити кеш, лог-файли, або тимчасові ресурси Figma."

read -r -p "❓ Очистити всі знайдені директорії? [y/N] " response
case "$response" in
  [yY][eE][sS]|[yY])
    echo -e "\n🧽 Видаляю..."
    while IFS= read -r dir; do
      echo "🗑 $dir"
      rm -rf "$dir"
    done <<< "$figma_dirs"
    echo -e "\n✅ Усі Figma директорії очищено."
    ;;
  *)
    echo "❌ Очищення скасовано."
    ;;
esac
