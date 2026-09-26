#!/bin/bash
# =========================================================
# Лабораторная работа №1 — Вариант 10
# ЧАСТЬ 1: инициализация репозитория, создание дерева
#          каталогов/файлов, установка прав, первый коммит
# =========================================================
#
# ВАЖНО: перед запуском этого скрипта:
#   1) Создайте на GitHub НОВЫЙ пустой репозиторий (без README).
#   2) Скопируйте его URL (например https://github.com/USERNAME/lab0.git).
#   3) После выполнения git init ниже, добавьте remote командой:
#        git remote add origin <URL_вашего_репозитория>
#      (это можно сделать вручную в терминале перед git push,
#       либо раскомментировать и заполнить строку REMOTE_URL ниже)
#
# REMOTE_URL="https://github.com/USERNAME/lab0.git"

set -e   # остановить скрипт при первой ошибке

cd ~

# ---------------------------------------------------------
# 1. Инициализация репозитория
# ---------------------------------------------------------
git init lab0
cd lab0

# ---------------------------------------------------------
# 2. Создание дерева каталогов
# ---------------------------------------------------------
mkdir -p claude_monet/hall/tables
mkdir -p claude_monet/hall/waiters
mkdir -p claude_monet/kitchen
mkdir -p claude_monet/office
mkdir -p nastya_room
mkdir -p free_tables

# --- Создание файлов с содержимым ---

cat > claude_monet/hall/tables/table_three << 'EOF'
За третьим столиком ждут двух гостей
Гости заказали салат и горячее блюдо
Настя передала заказ на кухню
Счёт попросили принести после десерта
EOF

cat > claude_monet/hall/tables/table_seven << 'EOF'
Седьмой столик забронирован на вечер
Постоянные гости попросили старое меню
Костя готовит для них напитки
Настя проверяет заказ перед подачей
EOF

cat > claude_monet/hall/waiters/shift_list << 'EOF'
Настя обслуживает центральную часть зала
Саша работает у столиков возле окна
Первая смена начинается до открытия
После банкета официанты помогают закрыть зал
EOF

cat > claude_monet/hall/waiters/tip_report << 'EOF'
Третий столик оставил хорошие чаевые
Гости у окна поблагодарили Настю
На банкете чаевые разделили между официантами
Итоговый отчёт передали Вике
EOF

cat > claude_monet/hall/guest_requests << 'EOF'
Один гость просит блюдо без лука
Для ребёнка нужен небольшой десерт
Постоянный гость хочет поговорить с Бариновым
Настя уточняет каждый особый заказ
EOF

cat > claude_monet/kitchen/vegetarian_menu << 'EOF'
Овощной салат для Насти
Рататуй по рецепту Баринова
Тёплая закуска без мяса
Фруктовый десерт от Луи
EOF

cat > claude_monet/kitchen/barinov_order << 'EOF'
Все заказы передавать на кухню без задержки
Новое блюдо показывать шефу перед подачей
Настя отвечает за пожелания важных гостей
После смены подготовить общий отчёт
EOF

cat > claude_monet/office/vika_instruction << 'EOF'
Вика собирает официантов перед открытием
Настя проверяет готовность столиков
Во время смены жалобы записывают сразу
Вечером отчёты передают управляющей
EOF

cat > nastya_room/nastya_diary << 'EOF'
Настя пришла в ресторан вместе с Костей
До открытия она помогла украсить зал
Постоянные гости узнали Настю
После смены Костя ждал её у бара
EOF

cat > evening_message << 'EOF'
Сегодня в ресторане проходит большой банкет
Настя назначена старшей среди официантов
Вика проверит зал в шесть часов
Баринов ждёт первые заказы на кухне
EOF

# ---------------------------------------------------------
# 3. Установка прав доступа
# ---------------------------------------------------------

# --- Числовым способом ---
chmod 755 claude_monet
chmod 750 claude_monet/hall/tables
chmod 640 claude_monet/hall/tables/table_seven
chmod 660 claude_monet/hall/waiters/shift_list
chmod 644 claude_monet/hall/guest_requests
chmod 640 claude_monet/kitchen/barinov_order
chmod 750 claude_monet/office
chmod 640 nastya_room/nastya_diary
chmod 700 free_tables

# --- Символьным способом ---
chmod u=rwx,g=rx,o= claude_monet/hall
chmod u=rw,g=r,o= claude_monet/hall/tables/table_three
chmod u=rwx,g=rx,o= claude_monet/hall/waiters
chmod u=rw,g=r,o=r claude_monet/hall/waiters/tip_report
chmod u=rwx,g=rx,o=rx claude_monet/kitchen
chmod u=r,g=r,o=r claude_monet/kitchen/vegetarian_menu
chmod u=rw,g=r,o= claude_monet/office/vika_instruction
chmod u=rwx,g=rx,o= nastya_room
chmod u=rw,g=r,o=r evening_message

# ---------------------------------------------------------
# 4. Проверка статуса, индекс, коммит
# ---------------------------------------------------------
git status
git add .
git commit -m "Создано дерево каталогов и файлов, установлены права доступа"

# ---------------------------------------------------------
# 5. Публикация в удалённый репозиторий
# ---------------------------------------------------------
# Если remote ещё не добавлен, раскомментируйте следующую строку
# и укажите URL вашего репозитория:
# git remote add origin "$REMOTE_URL"

git branch -M main
git push -u origin main