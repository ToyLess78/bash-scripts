#!/bin/bash

echo "🧼 JetBrains Cache Cleaner (safe mode for PhpStorm)"

# Знайти всі продукти JetBrains
jetbrains_base="$HOME/Library"

echo -e "\n🔍 Пошук встановлених JetBrains продуктів..."
products=$(find "$jetbrains_base/Application Support/JetBrains" -maxdepth 1 -type d -name "*[0-9]*" -exec basename {} \;)

if [ -z "$products" ]; then
  echo "❌ Не знайдено JetBrains продуктів"
  exit 0
fi

for product in $products; do
  echo -e "\n📦 $product"

  # Шляхи
  cache="$jetbrains_base/Caches/JetBrains/$product"
  logs="$jetbrains_base/Logs/JetBrains/$product"
  saved="$jetbrains_base/Saved Application State/com.jetbrains.$product.savedState"

  # Показати розміри
  echo "📁 Кеш: "; du -sh "$cache" 2>/dev/null
  echo "📁 Логи:"; du -sh "$logs" 2>/dev/null
  echo "📁 Saved state:"; du -sh "$saved" 2>/dev/null

  # Питання про очищення
  read -r -p "🧽 Очистити кеші та логи для $product? [y/N] " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    rm -rf "$cache" "$logs" "$saved"
    echo "✅ Очищено."
  else
    echo "⏭ Пропущено."
  fi
done

echo -e "\n🎉 Готово. Налаштування та ліцензії НЕ були змінені."
