#!/usr/bin/env bash
# start-server.sh

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

if [ "$FLUSH_DB" = "yes" ] ; then
    echo "Flushing..."
    python manage.py flush --no-input
    echo "Flush completed..."
fi

if [ "$MIGRATE_DB" = "yes" ] ; then
    echo "Running migrations..."
    python manage.py migrate --no-input
    echo "Migrations completed..."
fi

if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] ; then
    echo "Creating Django admin user..."
    python manage.py createsuperuser --no-input
fi

echo "Collecting static files..."
python manage.py collectstatic --no-input
echo "Static files collected..."

echo "Starting gunicorn and nginx..."

gunicorn caveapp.wsgi $GUNICORN_OPTS --user www-data --bind 0.0.0.0:8010 --workers 3 & nginx -g "daemon off;"
