#!/usr/bin/env bash
# start-server.sh
if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] ; then
    (cd cavedb; python manage.py createsuperuser --no-input)
fi

echo ""
echo "Starting server. Access at http://127.0.0.1:8000/"
echo ""

(cd cavedb; gunicorn caveapp.wsgi --user www-data --bind 0.0.0.0:8010 --workers 3) &
nginx -g "daemon off;"
