# DESCRIPTION

This project uses MongoDB replicaset as the datastore and serve request using graphql.

There are 2 models Person & Event both data are stored in MongoDB.

## Assumptions

* Person colection is queried based on their name and date of birth, and there is no concept of Person->id

## Running Locally

this will start the app, but will take some time to load everything up, meantime you can watch the log using `docker-compose up`

```
./start-app.sh
```

To destroy the stack run the below
```
docker-compose down
```

## Running tests

```
/start-test.sh
```