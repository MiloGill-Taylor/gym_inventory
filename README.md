# README

Configuration:

ruby: 3.1.2

rails: 7.0.4

How to Run Locally:
- Download repo
- Run "bundle config set --local without 'production'"
- Run "bundle"
- Run "rails importmap:install turbo:install stimulus:install"
- Run "rails db:migrate"
- Run "rails server"
- navigate to 'http://localhost:3000/' on any browser

To run the tests:
- Run "rails test" to run the unit tests
- Run "bundle exec rspec" to run the request specs
