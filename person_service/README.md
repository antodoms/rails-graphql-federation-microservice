# DESCRIPTION

## Running Locally

### 1. Start the postgres database

```
docker-compose up
```

### 2. setup and run rails app

```
bundle install
rails db:create db:migrate db:seed
```