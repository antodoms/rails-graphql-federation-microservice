#!/bin/bash

docker-compose up -d

sleep 5

docker exec mongo1 /scripts/rs-init.sh

docker-compose exec event_service bundle exec rspec

docker-compose down