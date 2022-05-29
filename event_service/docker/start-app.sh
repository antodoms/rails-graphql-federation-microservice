#!/bin/bash

bundle install

bundle exec rails db:drop db:create db:seed

bundle exec rails s -b 0.0.0.0

