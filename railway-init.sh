#!/bin/bash

# Script de inicialización para Railway
# Establece variables de entorno por defecto para evitar warnings

export APP_ENV=${APP_ENV:-"production"}
export APP_DEBUG=${APP_DEBUG:-"false"}
export LOG_LEVEL=${LOG_LEVEL:-"error"}
export CACHE_STORE=${CACHE_STORE:-"database"}
export SESSION_DRIVER=${SESSION_DRIVER:-"database"}
export QUEUE_CONNECTION=${QUEUE_CONNECTION:-"database"}
export FILESYSTEM_DISK=${FILESYSTEM_DISK:-"local"}
export MAIL_MAILER=${MAIL_MAILER:-"log"}
export BROADCAST_CONNECTION=${BROADCAST_CONNECTION:-"log"}
export APP_LOCALE=${APP_LOCALE:-"es"}
export APP_FALLBACK_LOCALE=${APP_FALLBACK_LOCALE:-"es"}

# Variables vacías para evitar warnings
export DB_CACHE_CONNECTION=${DB_CACHE_CONNECTION:-""}
export AWS_BUCKET=${AWS_BUCKET:-""}
export DB_CACHE_LOCK_CONNECTION=${DB_CACHE_LOCK_CONNECTION:-""}
export DB_CACHE_LOCK_TABLE=${DB_CACHE_LOCK_TABLE:-""}
export AWS_URL=${AWS_URL:-""}
export MEMCACHED_PERSISTENT_ID=${MEMCACHED_PERSISTENT_ID:-""}
export MEMCACHED_USERNAME=${MEMCACHED_USERNAME:-""}
export AWS_ENDPOINT=${AWS_ENDPOINT:-""}
export MEMCACHED_PASSWORD=${MEMCACHED_PASSWORD:-""}
export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID:-""}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY:-""}
export LOG_SLACK_WEBHOOK_URL=${LOG_SLACK_WEBHOOK_URL:-""}
export DYNAMODB_ENDPOINT=${DYNAMODB_ENDPOINT:-""}
export MAIL_LOG_CHANNEL=${MAIL_LOG_CHANNEL:-""}
export DB_URL=${DB_URL:-""}
export PAPERTRAIL_URL=${PAPERTRAIL_URL:-""}
export DB_QUEUE_CONNECTION=${DB_QUEUE_CONNECTION:-""}
export PAPERTRAIL_PORT=${PAPERTRAIL_PORT:-""}
export SESSION_DOMAIN=${SESSION_DOMAIN:-""}
export LOG_STDERR_FORMATTER=${LOG_STDERR_FORMATTER:-""}
export MAIL_SCHEME=${MAIL_SCHEME:-""}
export SQS_SUFFIX=${SQS_SUFFIX:-""}
export MAIL_URL=${MAIL_URL:-""}
export POSTMARK_TOKEN=${POSTMARK_TOKEN:-""}
export SESSION_SECURE_COOKIE=${SESSION_SECURE_COOKIE:-""}

echo "Variables de entorno configuradas correctamente"

# Ejecutar migraciones
if [ "$APP_ENV" = "production" ]; then
    php artisan migrate --force
    echo "Migraciones ejecutadas"
fi

# Iniciar el servidor
exec "$@"
