# DESCRIPTION

This project uses MongoDB replicaset as the datastore and serve request using graphql.

There are 2 models Person & Event both data are stored in MongoDB.

## Assumptions

* Person colection is queried based on their name and date of birth, and there is no concept of Person->id

## Running Locally

### 1. start MongoDB replicasets (1 primary and 2 secondary nodes)

```
./startdb.sh
```

### 2. Run the rails app

```
bundle install
rails s
```

### 3. stop and destroy database

```
docker-compose down
```

## Running tests

```
./startdb.sh
rspec
docker-compose down
```