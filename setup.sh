#!/bin/sh

sh cleanup.sh

if [ -e ".env" ]; then
  printf "\n>>> rm .env...\n"
  rm .env
fi

printf "\n>>> make .env...\n"
touch .env

echo "METABASE_PG=metabase_postgres" >> .env
echo "POSTGRES_DB=metabase" >> .env
echo "POSTGRES_USER=metabase" >> .env

printf "\n>>> input user password...\n"
read -p " - PostgreSQL_USER_PASSWORD : " POSTGRES_PASSWORD
echo "POSTGRES_PASSWORD=${POSTGRES_PASSWORD}" >> .env

printf "\n>>> container up...\n"
docker-compose up -d

touch db/data/.gitignore
printf "*\n!.gitignore\n" >> db/data/.gitignore

printf "\n>>> setup completed\n"

exit 0

