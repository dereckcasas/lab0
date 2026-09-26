#!/bin/bash
set -e
cd ~/lab0

cp nastya_room/nastya_diary claude_monet/office/waitress_report

cp -r claude_monet/hall/tables claude_monet/hall/tables_backup

ln -s ../claude_monet/hall/guest_requests nastya_room/today_requests

ln -s claude_monet/hall hall_entry

ln evening_message claude_monet/hall/shift_message

cat claude_monet/hall/tables/table_three claude_monet/hall/tables/table_seven \
    > claude_monet/hall/reservation_plan

cat claude_monet/office/vika_instruction >> claude_monet/hall/waiters/shift_list

mv claude_monet/hall/waiters/tip_report claude_monet/office/evening_tips

git status
git add .
git commit -m "Копирование, перемещение файлов и создание ссылок"
git push