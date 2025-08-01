#!/usr/bin/env bash
# exit on error
set -o errexit

apt-get update && apt-get install -y libpq-dev libyaml-dev build-essential
bundle install
bundle exec rails assets:precompile
bundle exec rails db:migrate
bundle exec rails db:seed