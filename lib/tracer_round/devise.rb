module TracerRound
  class Devise
    def self.configure!
      Warden::Manager.after_authentication do |user, auth, _opts|
        TracerRound::Logger.new('login', user.id, auth.request.remote_ip, auth.request.env['HTTP_USER_AGENT'])
      end

      Warden::Manager.before_logout do |user, auth, _opts|
        TracerRound::Logger.new('logout', user.id, auth.request.remote_ip, auth.request.env['HTTP_USER_AGENT'])
      end
    end
  end
end
