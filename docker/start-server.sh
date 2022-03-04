#!/usr/bin/env bash
# start-server.sh
if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] ; then
    (cd cavedb; python manage.py createsuperuser --no-input)
fi

echo ""
echo "Starting server. Access at http://127.0.0.1:8000/"
echo ""
cd cavedb

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started..."
fi

echo "Flushing..."
python manage.py flush --no-input
echo "Flush completed..."

echo "Running migrations..."
python manage.py migrate
echo "Migrations completed..."

echo "Starting gunicorn..."

gunicorn caveapp.wsgi --daemon --user www-data --bind 0.0.0.0:8010 --workers 3

echo "Gunicorn started..."

echo "Starting nginx..."
echo "Access server at http://127.0.0.1:8000"

nginx -g "daemon off;"
