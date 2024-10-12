# Використовуємо базовий образ Python
FROM python:3.9

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо файли requirements.txt для встановлення залежностей
COPY requirements.txt .

# Встановлюємо залежності
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо всі файли проекту в контейнер
COPY . .

# Визначаємо порт, на якому працюватиме застосунок
EXPOSE 8000

# Команда для запуску FastAPI застосунку
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
