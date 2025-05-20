#!/bin/bash

echo "🔍 Analyzing system-level data and caches...\n"

# VAR FOLDERS
echo "📂 Checking /private/var/folders (system temp & caches):"
sudo du -sh /private/var/folders

echo -e "\n📋 Top 10 largest directories in /private/var/folders:"
sudo du -sh /private/var/folders/* | sort -hr | head -n 10

echo -e "\n📂 Checking /System/Volumes/Data (user & app data volume):"
sudo du -h -d 1 /System/Volumes/Data 2>/dev/null | sort -hr

echo -e "\n📋 Top 10 largest directories in /System/Volumes/Data/Library:"
sudo du -sh /System/Volumes/Data/Library/* 2>/dev/null | sort -hr | head -n 10

echo -e "\n📋 Top 10 largest directories in /System/Volumes/Data/Users:"
sudo du -sh /System/Volumes/Data/Users/* 2>/dev/null | sort -hr | head -n 10

echo -e "\n✅ Analysis complete."

echo -e "\n💡 Tips:"
echo "• /private/var/folders — можна очищати вміст, macOS відновить кеш при потребі"
echo "• /System/Volumes/Data/Library/Application Support — тут кеші програм (Xcode, Chrome, Slack)"
echo "• /System/Volumes/Data/Users/<you>/Library — обережно, містить персональні налаштування"
echo "• Для глибокого очищення рекомендується DaisyDisk або CleanMyMac (перевірка вручну перед видаленням)"

echo -e "\n🛑 УВАГА: скрипт лише перевіряє. Нічого не видаляється!"
