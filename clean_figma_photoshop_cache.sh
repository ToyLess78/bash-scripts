#!/bin/bash

echo "🧼 Figma & Photoshop Cache Cleanup Tool"

# === Utility function ===
check_size() {
  if [ -d "$1" ]; then
    du -sh "$1"
  else
    echo "❌ Not found: $1"
  fi
}

confirm() {
  read -r -p "$1 [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY]) true ;;
    *) false ;;
  esac
}

# === Figma ===
echo -e "\n📦 Checking Figma caches:"
figma_cache="$HOME/Library/Caches/com.figma.Desktop"
figma_support="$HOME/Library/Application Support/Figma"

check_size "$figma_cache"
check_size "$figma_support"

if confirm "🧽 Очистити кеш Figma (обидва шляхи)?"; then
  rm -rf "$figma_cache"
  rm -rf "$figma_support"
  echo "✅ Кеш Figma очищено"
fi

# === Photoshop ===
echo -e "\n📦 Checking Photoshop data (Application Support + possible scratch cache):"
ps_appsupport="$HOME/Library/Application Support/Adobe"
scratch_area="/private/var/folders"

check_size "$ps_appsupport"
sudo du -sh "$scratch_area" 2>/dev/null | grep scratch

if confirm "🧽 Очистити кеш Photoshop + scratch диски (/private/var/folders)?"; then
  sudo rm -rf "$scratch_area"
  echo "✅ Photoshop кеші очищено"
fi

echo -e "\n🎉 Done!"
