require 'active_record'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

ActiveRecord::Schema.define do
  self.verbose = false
  create_table :user_session_logs do |t|
    t.integer :user_id
    t.string :action
    t.string :origin_ip
    t.string :origin_country
    t.string :origin_device
    t.string :origin_browser
    t.timestamps null: false
  end
end

require 'bundler/setup'
Bundler.setup

require 'tracer_round' # and any other gems you need

RSpec.configure do |config|
  # some (optional) config here
end
