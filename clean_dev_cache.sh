#!/bin/bash

confirm() {
  read -r -p "$1 [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY]) true ;;
    *) false ;;
  esac
}

echo "🧹 Cleaning development caches..."

# npm
if confirm "🧽 Очистити кеш npm (~/.npm)?"; then
  npm cache clean --force
  echo "✅ npm кеш очищено"
fi

# pnpm
if confirm "🧽 Очистити кеш pnpm store?"; then
  pnpm store prune
  rm -rf "$(pnpm store path)"
  echo "✅ pnpm store очищено"
fi

# Gradle
if confirm "🧽 Очистити кеш Gradle (~/.gradle/caches)?"; then
  rm -rf ~/.gradle/caches
  echo "✅ Gradle кеш очищено"
fi

# Xcode
if confirm "🧽 Очистити Xcode DerivedData?"; then
  rm -rf ~/Library/Developer/Xcode/DerivedData
  echo "✅ Xcode кеш очищено"
fi

# iOS Симулятори
if confirm "🧽 Очистити iOS симулятори (CoreSimulator Devices)?"; then
  rm -rf ~/Library/Developer/CoreSimulator/Devices
  echo "✅ Симулятори очищено"
fi

# Docker
if confirm "🧽 Очистити Docker образи, build cache та обʼєми?"; then
  docker system prune -a --volumes -f
  echo "✅ Docker очищено"
fi

echo "🎉 Готово!"
