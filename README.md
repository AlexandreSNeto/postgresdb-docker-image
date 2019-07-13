This is a PostgreSQL image that already creates a database and a user 

# Building

```
docker build -t postgres-db .
```

# How to use

## Using default values

```
docker run postgres-db
```

This will create a database named `database` with a user called `user` with password `password`. This is not a good idea for production, but you may need this for some tests.

## Using custom values

```
docker run -d \
    -e DB_NAME=YOUR-DB-NAME \
    -e DB_USER=YOUR-USER \
    -e DB_PASS=USER-PASSWORD \
    postgres-db
```

## Full Example:

```
docker run -d \
    -e DB_NAME=vehiclestore \
    -e DB_USER=cardealer \
    -e DB_PASS=mustang67 \
    -p 5432:5432 --name my-vehicle-store-db postgres-db
```