[![Build Status](https://travis-ci.org/Oneflare/tracer_round.svg?branch=master)](https://travis-ci.org/Oneflare/tracer_round)
# TracerRound

TracerRound is a simple gem to track your users login and logout activity in a user_session_logs table. The gem currently records key information such as who the user was, the action (login or logout), the ip address, the geocoded country and the timestamp.

TracerRound currently supports the following authentication frameworks:
- Devise
- Clearance (coming soon!)

The audit table looks something like this.

| user_id        | origin_ip         | origin_country    | origin_device  | origin_browser | action        | created_at
| -------------- | -------------     | -------------     | -------------  | -------------  | ------------- | -------------
| 5              | 127.0.0.1         | India             | mobile         | Chrome         | login         | 2016-01-01 12:00:00


## Documentation

### Installation

1. Add TracerRound to your `Gemfile`.

    `gem 'tracer_round'`

1. Add a `user_session_logs` table to your database.

    ```
    bundle exec rails generate tracer_round:install
    bundle exec rake db:migrate
    ```

1. Restart rails!

### Help out!

The purpose of this gem was to assist with identifying accounts that have strange account activity. If you believe we can improve visibily by collecting and storing additional information; jump on board! Fork the project and submit a pull request for review.

P.s This code has been Rubocopified to the best of my ability.
