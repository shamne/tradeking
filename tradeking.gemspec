$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'tradeking/version'

Gem::Specification.new do |s|
  s.authors     = ["Sasha Shamne"]
  s.name        = "Tradeking API wrapper"
  s.version     = Tradeking::VERSION
  s.email       = ["a@shamne.com"]
  s.summary     = "Ruby wrapper for a Tradeking API"
  s.description = "Allows access to a Tradeking account's rest operations https://developers.tradeking.com/documentation/getting-started"

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ["lib"]

  s.add_dependency "oauth"
  s.add_dependency "json"

  s.add_development_dependency('rdoc')
  s.add_development_dependency('rake')
end
