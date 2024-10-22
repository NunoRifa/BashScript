#!/bin/bash

# Folder A dan Folder B (gunakan / pada path)
FOLDER_A="D:/Publishan/Publish_EMR_17102024/Publish/bin"
FOLDER_B="D:/Publishan/Publish_EMR_12102024/Publish/bin"

# Cek apakah kedua folder ada
if [ ! -d "$FOLDER_A" ]; then
  echo "Folder A tidak ditemukan: $FOLDER_A"
  exit 1
fi

if [ ! -d "$FOLDER_B" ]; then
  echo "Folder B tidak ditemukan: $FOLDER_B"
  exit 1
fi

# Mencari file yang ada di Folder A tapi tidak ada di Folder B berdasarkan nama dan struktur folder
echo "Mencari file yang ada di Folder A tapi tidak ada di Folder B..."
for file in $(find "$FOLDER_A" -type f); do
  relative_path="${file#$FOLDER_A/}"  # Mendapatkan path relatif dari file
  if [ ! -f "$FOLDER_B/$relative_path" ]; then
    echo "$relative_path"
  fi
done

echo "Selesai."
