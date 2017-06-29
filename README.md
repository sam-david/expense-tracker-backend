# ExpenseTracker : Backend

This project is the backend server developed for the Gigster coding challenge.

## Seed the database

Please create and seed the database to create test users and expenses. Login info can be found in the [seeds.rb](db/seeds.rb). The frontend client should automatically login, as the credentials are hardcoded, so this is not necessary to test the application.

## Running server

Run `rails server` to start server. Use frontend client to interface with backend after starting server.

## Testing

Run `rspec spec`. Note: Tests are WIP as controllers were altered from Rails view controllers to API. Responses need to be handled differently in testing.
