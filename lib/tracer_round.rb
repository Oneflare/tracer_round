# Require frameworks.
require 'active_record'
require 'rails'
require 'maxminddb'
require 'browser'

# Bullets are fast.
require 'tracer_round/logger'
require 'tracer_round/models/user_session_log'
require 'tracer_round/devise'
require 'tracer_round/clearance'
require 'tracer_round/railtie' if defined? ::Rails::Railtie

module TracerRound
  class Config
    attr_accessor :maxmind_database_path
  end

  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield config
  end
end
