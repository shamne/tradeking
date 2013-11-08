$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'tradeking/version'

Gem::Specification.new do |s|
  s.authors     = ["Sasha Shamne"]
  s.name        = "tradeking"
  s.version     = Tradeking::VERSION
  s.email       = ["a@shamne.com"]
  s.description     = "Ruby wrapper for a Tradeking API"
  s.summary = "Allows access to a Tradeking account's rest operations https://developers.tradeking.com/documentation/getting-started"

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ["lib"]

  s.add_dependency("oauth", '>= 0.4.6')
  s.add_dependency("json", '>= 1.6.1')

  s.add_development_dependency('rdoc')
  s.add_development_dependency('rake', '>= 0.9.3')
  s.add_development_dependency('webmock', '>= 1.8.0')
end
