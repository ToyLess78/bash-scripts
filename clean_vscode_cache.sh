#!/bin/bash

echo "🧼 VS Code Cache Cleaner"

vscode_config="$HOME/Library/Application Support/Code"
vscode_extensions="$HOME/.vscode"
vscode_saved="$HOME/Library/Saved Application State/com.microsoft.VSCode.savedState"

# Check sizes
echo -e "\n📦 Application Support (кеш, сесії):"
du -sh "$vscode_config"

echo -e "\n📦 Розширення (залишимо за замовчуванням):"
du -sh "$vscode_extensions"

echo -e "\n📦 Saved window state:"
du -sh "$vscode_saved" 2>/dev/null

read -r -p "❓ Очистити кеші VS Code (без видалення розширень)? [y/N] " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
  rm -rf "$vscode_config/Cache" \
         "$vscode_config/CachedData" \
         "$vscode_config/Code Cache" \
         "$vscode_config/Service Worker" \
         "$vscode_saved"
  echo "✅ VS Code кеші очищено."
else
  echo "❌ Скасовано."
fi
