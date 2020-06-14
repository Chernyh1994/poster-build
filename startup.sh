#!/bin/sh

WEB=https://github.com/Chernyh1994/poster-client-react.git
API=https://github.com/Chernyh1994/poster-laravel-api-server.git

if [ -d ./poster-client-react ]
then
  cd poster-client-react && git checkout master && git pull
  cd ..
else
  git clone $WEB
fi

if [ -d ./poster-laravel-api-server ]
then
  cd poster-laravel-api-server && git checkout master && git pull
  cd ..
else
  git clone $API
fi

docker-compose up --build

exit 0