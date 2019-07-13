#!/bin/bash

echo "******CREATING DATABASE******"
#gosu postgres postgres --single <<- EOSQL
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<- EOSQL
   CREATE ROLE $DB_USER WITH LOGIN ENCRYPTED PASSWORD '${DB_PASS}' CREATEDB;
EOSQL

#gosu postgres postgres --single <<- EOSQL
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<- EOSQL
   CREATE DATABASE $DB_NAME WITH OWNER $DB_USER TEMPLATE template0 ENCODING 'UTF8';
EOSQL

#gosu postgres postgres --single <<- EOSQL
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<- EOSQL
   GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOSQL

echo ""
echo "******DATABASE CREATED******"