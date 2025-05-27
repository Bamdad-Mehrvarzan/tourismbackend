#!/bin/bash
set -e

echo "Running Django setup commands..."

python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --noinput

echo "Starting Gunicorn server..."


exec gunicorn config.wsgi:application --bind 0.0.0.0:8000 --workers=4 --threads=1 --timeout 120
