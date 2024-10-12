#!/bin/bash

# Список вебсайтів для перевірки
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

# Назва файлу для запису логів
log_file="website_status.log"

# Очищення або створення файлу логів
> "$log_file"

# Перевірка доступності кожного сайту
for website in "${websites[@]}"; do
    # Використання curl для перевірки статусу сайту
    response=$(curl -s -o /dev/null -w "%{http_code}" "$website")

    if [ "$response" -eq 200 ]; then
        echo "$website is UP" | tee -a "$log_file"
    else
        echo "$website is DOWN" | tee -a "$log_file"
    fi
done

# Повідомлення про завершення
echo "Results have been logged in $log_file"