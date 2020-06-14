#!/bin/sh

WEB=https://github.com/Chernyh1994/poster-client-react.git
API=https://github.com/Chernyh1994/poster-laravel-api-server.git

if [ -d ./poster-client-react ]
then
  git pull ./poster-client-react
else
  git clone $WEB
fi

if [ -d ./poster-laravel-api-server ]
then
   git pull ./poster-laravel-api-server
else
  git clone $API
fi

docker-compose up --build

exit 0