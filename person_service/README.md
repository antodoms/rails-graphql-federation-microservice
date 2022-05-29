# DESCRIPTION

This project uses postrgesDB as the datastore and serve request using graphql

There is only one model Person in this project, also the database structure of Person in this project is different fron Envent Service project.


## Assumptions

* Person colection is queried based on their name and date of birth, and there is no concept of Person->id

## Technical Stack

* Backend - Ruby on rails + Graphql
* Database - PostgresQL

## Running Locally

this will start the app, but will take some time to load everything up, meantime you can watch the log using `docker-compose up`

```
./start-app.sh
```

Then visit `http://localhost:3001/`

To destroy the stack run the below
```
docker-compose down
```

## Running tests

```
/start-test.sh
```