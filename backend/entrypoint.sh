#!/bin/bash

# Set correct ownership of Laravel files
chown -R www-data:www-data /var/www/html

php artisan migrate

# Execute the CMD or Dockerfile's ENTRYPOINT
exec "$@"
