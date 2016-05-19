module TracerRound
  class Logger
    attr_accessor :action, :user_id, :origin_ip, :http_user_agent

    def initialize(action, user_id, origin_ip, http_user_agent)
      @action = action
      @user_id = user_id
      @origin_ip = origin_ip
      @http_user_agent = http_user_agent
      log
    end

    def log
      UserSessionLog.create(params)
    end

    def params
      {
        action: @action,
        user_id: @user_id,
        origin_ip: @origin_ip,
        origin_country: origin_country,
        origin_device: origin_device,
        origin_browser: origin_browser
      }
    end

    def browser
      Browser.new(@http_user_agent, accept_language: 'en-us')
    end

    def origin_country
      if File.exist?(TracerRound.config.maxmind_database_path)
        db = MaxMindDB.new(TracerRound.config.maxmind_database_path)
        db.lookup(origin_ip).country.name
      else
        puts 'ERROR: Maxmind database could not be found. IP GEO lookups have been disabled.'
        return nil
      end
    end

    def origin_device
      browser.device.name
    end

    def origin_browser
      browser.name
    end
  end
end
