# Dockerfile

FROM python:3.9-buster

# Install nginx and vim, and copy nginx configuration
RUN apt-get update && apt-get install nginx \
    libpq-dev python3-dev \
    -y --no-install-recommends
COPY docker/nginx.default /etc/nginx/sites-available/default

# Log nginx to stdout
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# Create application folders
RUN mkdir -p /opt/app
RUN mkdir -p /opt/app/pip_cache
RUN mkdir -p /opt/app/cavedb

# Copy application
COPY requirements.txt docker/start-server.sh /opt/app/
COPY app /opt/app/cavedb/

# Setup application environment
WORKDIR /opt/app
RUN --mount=type=cache,target=/root/.cache/pip pip install -r requirements.txt
RUN chown -R www-data:www-data /opt/app

# Run application
EXPOSE 8000
STOPSIGNAL SIGTERM
CMD ["/opt/app/start-server.sh"]
