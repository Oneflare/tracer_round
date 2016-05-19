$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'tracer_round/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'tracer_round'
  s.version     = TracerRound::VERSION
  s.authors     = ['James Martin']
  s.email       = ['james@oneflare.com']
  s.homepage    = 'https://www.oneflare.com.au'
  s.summary     = 'TracerRound is a simple gem to track your users login and logout activity'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 4.2'
  s.add_dependency 'maxminddb'
  s.add_dependency 'browser', '~> 2.1.0'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'activerecord'
  s.add_development_dependency 'sqlite3'
end
