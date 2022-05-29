#!/bin/bash

docker-compose up -d

sleep 5

docker-compose exec event_service bundle exec rspec

docker-compose down