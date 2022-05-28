# DESCRIPTION

This project uses postrgesDB as the datastore and serve request using graphql

There is only one model Person in this project, also the database structure of Person in this project is different fron Envent Service project.


## Assumptions

* Person colection is queried based on their name and date of birth, and there is no concept of Person->id


## Running Locally

### 1. Start the postgres database

```
docker-compose up
```

### 2. setup and run rails app

```
bundle install
rails db:create db:migrate db:seed
rails s
```

### 3. stop and destroy database

```
docker-compose down
```

## Running tests

```
docker-compose up
rails db:create db:migrate
rspec
docker-compose down
```