# bookshelf
small books library

Make sure, that you've got installed Redis and start it on port 6379

1) git clone git@github.com:edenisn/bookshelf.git
2) cd bookshelf and bundle install
3) make bundle exec rake db:create db:migrate db:seed
4) make bundle exec rake generate_records:books to generate 10_000_000 random books
5) Admin - email: admin@test.com, password: admin123
