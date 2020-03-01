#!/bin/bash
kill $(cat tmp/pids/puma.pid)
git pull
bundle exec rails assets:precompile RAILS_ENV=production
sudo service nginx restart
rails s -e production

