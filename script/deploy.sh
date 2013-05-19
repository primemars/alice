# This file need to be run in the dir which the file in
source ./deploy.source
bundle install --without development test
rake db:migrate  RAILS_ENV=production
restart
