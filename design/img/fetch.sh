#!/usr/bin/env bash
# すでに生成済みの仮イメージ11枚をダウンロードし、Web用（横1200px・JPEG）に縮小する
# 実際の写真ができたら、同じファイル名で差し替えてください
set -euo pipefail
cd "$(dirname "$0")"
B=https://d8j0ntlcm91z4.cloudfront.net/user_3D26DLIgatnhSlMTKhlXxjJFU8V
while read -r name id; do
  curl -sfL -o "$name.png" "$B/$id.png"
  python3 -c "from PIL import Image; im=Image.open('$name.png').convert('RGB'); im.thumbnail((1200,1200)); im.save('$name.jpg', quality=78, optimize=True, progressive=True)"
  rm "$name.png"; echo "ok  $name.jpg"
done <<'LIST'
hero        hf_20261005_142500_64b19f9b-80dc-488e-91b0-f1b516a61351
case-bulb   hf_20261005_142500_bde74ff8-83c4-45c3-8845-ec0a89479e52
case-chest  hf_20261005_142406_9ceb6c8b-7d41-4da8-95f5-da8b71459fd1
case-shelf  hf_20261005_142403_101c7a90-83f1-4f1d-be8e-c79164ef08f8
case-visit  hf_20261005_142406_36d2836a-1628-4a67-b724-2ca22b45edf5
garden      hf_20261005_142403_45003a06-20fd-4c92-b3d6-867ae4f453b8
team        hf_20261005_142501_c949704c-59da-4556-889c-6ae83d8fabc5
reception   hf_20261005_142403_7fb7b012-7042-4dd3-87c6-297b13f6d1c5
faucet      hf_20261005_142402_9bfd17ea-e73b-4fac-9af3-0bfbba2d86ef
garbage     hf_20261005_142405_a9c7287b-774f-4670-b32f-6d573254a965
shopping    hf_20261005_142406_20eeedc5-53c1-44f6-8689-d40d567385ee
LIST
