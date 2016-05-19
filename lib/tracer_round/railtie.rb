module TracerRound
  class Railtie < Rails::Railtie
    config.tracer_round = ActiveSupport::OrderedOptions.new

    # Allows the maxmind database path to be configurable in an initializer.
    initializer 'tracer_round.configure' do |app|
      TracerRound.configure do |config|
        config.maxmind_database_path = app.config.tracer_round[:maxmind_database_path] || default_maxmind_database_path
      end
    end

    # Configure whichever authentication framework is detected.
    initializer 'tracer_round.configure_rails_initialization' do
      TracerRound::Devise.configure! if defined? ::Devise
      TracerRound::Clearance.configure! if defined? ::Clearance
    end

    private

      # Internal: Use the gem-included MaxMind database as a default.
      #
      # Returns a file path
      def default_maxmind_database_path
        File.expand_path('../../../data/GeoLite22-Country.mmdb', __FILE__)
      end
  end
end
