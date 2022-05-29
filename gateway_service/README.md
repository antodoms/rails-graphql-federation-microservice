# DESCRIPTION

This project uses Apollo graphql gateway server, the main use of this is to join multiple graphql schema from multiple services to one schema. This is so that the frontend only needs to deal with one graphql endpoint instead of multiple endpoints from different services.

You can read more on Apollo graphql federation [here](https://www.apollographql.com/docs/federation/)

## Tech Stack

* Backend - ExpressJS (NodeJS)

## Running Locally

To start the stack

```
docker-compose up
```
Then visit `http://localhost:4000/`

To destroy the stack run the below
```
docker-compose down
```
