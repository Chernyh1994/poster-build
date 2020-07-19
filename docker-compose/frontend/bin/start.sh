#!/bin/bash

# Setup env
cd /var/www && rm -rf .env && touch .env

echo "REACT_APP_API_URL=$REACT_APP_API_URL" >> ./.env

npm start