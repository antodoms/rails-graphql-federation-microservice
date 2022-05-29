# DESCRIPTION

This project uses MongoDB replicaset as the datastore and serve request using graphql.

There are 2 models Person & Event both data are stored in MongoDB.

## Assumptions

* Person colection is queried based on their name and date of birth, and there is no concept of Person->id

## Future improvements

* Due to time limitations, wasn't able to separate out the frontend to its own service, so frontend to consume the services are part of this service.

* Using websockets to make the realtime data available to frontend, but ideally should be done using graphql-subscriptions.

## Technical Stack

* Backend - Ruby on rails + Graphql + Jquery + ActionCable (websocket)
* Database - MongoDB replicaset , Redis

## Running Locally

this will start the app, but will take some time to load everything up, meantime you can watch the log using `docker-compose up`

```
./start-app.sh
```
Then visit `http://localhost:3000/`

To destroy the stack run the below
```
docker-compose down
```

## Running tests

```
/start-test.sh
```

## Updating Events table

you can directly connect to the primary mongodb intance using MongoDB Compass or similar tools to update the data using GUI.