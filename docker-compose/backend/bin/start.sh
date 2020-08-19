#!/bin/bash
touch /var/www/storage/logs/cron.log

# Setup env
cd /var/www && rm -rf .env && touch .env && chgrp -R www-data .env

echo "APP_NAME=${APP_NAME:-Laravel}" >>./.env
echo "APP_ENV=${APP_ENV:-local}" >>./.env
echo "APP_KEY=$APP_KEY" >>./.env
echo "APP_DEBUG=${APP_DEBUG:-true}" >>./.env
echo "APP_URL=${APP_URL:-true}" >>./.env

echo "LOG_CHANNEL=${LOG_CHANNEL:-stack}" >>./.env

echo "DB_CONNECTION=${DB_CONNECTION:-mysql}" >>./.env
echo "DB_HOST=${DB_HOST:-127.0.0.1}" >>./.env
echo "DB_PORT=${DB_PORT:-3306}" >>./.env
echo "DB_DATABASE=${DB_DATABASE:-laravel}" >>./.env
echo "DB_USERNAME=${DB_USERNAME:-root}" >>./.env
echo "DB_PASSWORD=${DB_PASSWORD:-password}" >>./.env

echo "BROADCAST_DRIVER=${BROADCAST_DRIVER:-log}" >>./.env
echo "CACHE_DRIVER=${CACHE_DRIVER:-file}" >>./.env
echo "QUEUE_CONNECTION=${QUEUE_CONNECTION:-sync}" >>./.env
echo "SESSION_DRIVER=${SESSION_DRIVER:-file}" >>./.env
echo "SESSION_LIFETIME=${SESSION_LIFETIME:-120}" >>./.env

echo "REDIS_HOST=${REDIS_HOST:-127.0.0.1}" >>./.env
echo "REDIS_PASSWORD=${REDIS_PASSWORD:-null}" >>./.env
echo "REDIS_PORT=${REDIS_PORT:-6379}" >>./.env

echo "MAIL_MAILER=${MAIL_MAILER:-smtp}" >>./.env
echo "MAIL_HOST=${MAIL_HOST:-smtp.mailtrap.io}" >>./.env
echo "MAIL_PORT=${AWS_REGION:-us-east-2}" >>./.env
echo "MAIL_USERNAME=${MAIL_USERNAME:-null}" >>./.env
echo "MAIL_PASSWORD=${MAIL_PASSWORD:-null}" >>./.env
echo "MAIL_ENCRYPTION=${MAIL_ENCRYPTION:-null}" >>./.env
echo "MAIL_FROM_ADDRESS=${MAIL_FROM_ADDRESS:-null}" >>./.env
echo "MAIL_FROM_NAME=${APP_NAME:-"${APP_NAME}"}" >>./.env

echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >>./.env
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >>./.env
echo "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION:-us-east-1}" >>./.env
echo "AWS_BUCKET=$AWS_BUCKET" >>./.env

echo "PUSHER_APP_ID=$PUSHER_APP_ID" >>./.env
echo "PUSHER_APP_KEY=$PUSHER_APP_KEY" >>./.env
echo "PUSHER_APP_SECRET=$PUSHER_APP_SECRET" >>./.env
echo "PUSHER_APP_CLUSTER=${PUSHER_APP_CLUSTER:-mt1}" >>./.env

echo "MIX_PUSHER_APP_KEY=${PUSHER_APP_KEY:-"${PUSHER_APP_KEY}"}" >>./.env
echo "MIX_PUSHER_APP_CLUSTER=${PUSHER_APP_CLUSTER:"${PUSHER_APP_CLUSTER}"}" >>./.env

chgrp -R www-data storage
chgrp -R www-data bootstrap/cache

php artisan cache:refresh
