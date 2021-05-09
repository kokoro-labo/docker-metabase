#!/bin/sh

printf "\n>>> stop container...\n"
docker-compose stop

printf "\n>>> rm container...\n"
docker-compose rm -f

printf "\n>>> rm db/data dir...\n"

if [ -e "./db/data/" ]; then
    rm -rf "./db/data"
else
    printf " - ./db/data is not exists\n"
fi

printf "\n>>> make db/data dir...\n"

mkdir -p "./db/data"
touch db/data/.gitignore
printf "*\n!.gitignore\n" >> db/data/.gitignore

printf "\n>>> cleanup completed\n"

exit 0
