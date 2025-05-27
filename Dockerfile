# Base image
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /code

# نصب ابزارهای سیستمی مورد نیاز (chromium و dependencies)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc libpq-dev curl unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# نصب پکیج‌ها
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt


# کپی باقی کدهای پروژه
COPY . .

# اضافه کردن entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# اجرای پروژه
ENTRYPOINT ["/entrypoint.sh"]
