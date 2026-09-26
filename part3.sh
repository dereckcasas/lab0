#!/bin/bash
cd ~/lab0

echo "=== 1) Archivos, ordenados por tamano (ultimos 5) ==="
ls -laR . | grep '^-' | sort -k5 -n | tail -5
echo

echo "=== 2) Lineas con nastya/gost (sin postoyann) ==="
grep -rhi -E 'настя|гост' claude_monet nastya_room | grep -vi 'постоянн' | sort | head -6
echo

echo "=== 3) Cantidad de archivos con gost en tables y tables_backup ==="
grep -rli 'гост' claude_monet/hall/tables claude_monet/hall/tables_backup | wc -l
echo

echo "=== 4) Primera/ultima linea de tables (stolik/zakaz) ==="
( head -q -n1 claude_monet/hall/tables/table_three claude_monet/hall/tables/table_seven
  tail -q -n1 claude_monet/hall/tables/table_three claude_monet/hall/tables/table_seven ) \
  | grep -iE 'столик|заказ' | sort -r
echo

echo "=== 5) reservation_plan filtrado, cantidad de palabras ==="
grep -v 'Настя' claude_monet/hall/reservation_plan \
  | grep -iE 'гост|столик' | sort -r | head -4 | wc -w
echo

echo "=== 6) Archivos con 2 enlaces duros ==="
ls -laR . | grep -E '^-[-rwxsS]{9}\s+2\s' | sort -k9 -r
echo

echo "=== 7) Enlaces simbolicos, ultimo por alfabeto ==="
ls -laR . | grep '^l' | sort -k9 | tail -1
echo

rm nastya_room/nastya_diary
rm nastya_room/today_requests
rm hall_entry
rm evening_message
rm claude_monet/hall/shift_message
rm claude_monet/kitchen/barinov_order
rmdir free_tables
rm -r claude_monet/hall/tables_backup

git status
git add -A
git commit -m "Поиск, фильтрация данных и удаление файлов/каталогов"
git push
