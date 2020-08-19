#!/bin/bash

# -Start download frontend and backend. Install Software.-
./shell/install.sh
# -Variables.-
ENV=$PWD/.env
# -Functions checks for null.-
function ofNull() {
  while read -r -p "$1" DATA; do
    DATA=${DATA}
    if [[ "$DATA" =~ ^()$ ]]; then
      continue
    else
      echo "$DATA"
      break
    fi
  done
}
# -Functions checks for yes or no.-
function yesOrNo() {
  while read -r -p "$1" DATA; do
    DATA=${DATA}
    if [[ "$DATA" =~ ^(yes|y|no|n)$ ]]; then
      echo "$DATA"
      break
    else
      continue
    fi
  done
}
#
START_ANSWER=$(ofNull "You have $PWD/.env file? [y/N]: ")
if [[ "$START_ANSWER" =~ ^(yes|y)$ ]]; then
  if [ -f $ENV ]; then
    docker-compose up --build -d proxy
  else
    echo "We didn't find the file."
  fi
elif [[ "$START_ANSWER" =~ ^(no|n)$ ]]; then

  GENERATE_KEY=$(yesOrNo "Generate APP_KEY? [y/N] $(tput setaf 1)(required)$(tput sgr0): ")
  if [[ "$GENERATE_KEY" =~ ^(yes|y)$ ]]; then
    APP_KEY=`cd poster-laravel-api-server && sudo php artisan key:generate --show`
  elif [[ "$GENERATE_KEY" =~ ^(no|n)$ ]]; then
    APP_KEY=$(ofNull "APP_KEY
      > for example: $(tput setaf 2)base64:***/***/***=$(tput sgr0)
      > $(tput setaf 1)(required)$(tput sgr0): ")
  fi

  REACT_APP_API_URL=$(ofNull "REACT_APP_API_URL
    > for example: $(tput setaf 2)http://localhost:8000$(tput sgr0)
    > $(tput setaf 1)(required)$(tput sgr0): ")

  cd $PWD && rm -rf .env && touch .env

  echo "APP_KEY=$APP_KEY" >> ./.env
  echo "REACT_APP_API_URL=$REACT_APP_API_URL" >> ./.env

  docker-compose up --build -d proxy

else
  exit 0
fi

