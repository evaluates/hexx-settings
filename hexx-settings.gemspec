$:.push File.expand_path("../lib", __FILE__)
require "hexx/settings/version"

Gem::Specification.new do |gem|

  gem.name        = "hexx-settings"
  gem.version     = Hexx::Settings::VERSION.dup
  gem.author      = "Andrew Kozin"
  gem.email       = "andrew.kozin@gmail.com"
  gem.homepage    = "https://github.com/nepalez/hexx-settings"
  gem.summary     = "The interface for a gem's settings storage"
  gem.license     = "MIT"

  gem.files            = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.test_files       = Dir["spec/**/*.rb"]
  gem.extra_rdoc_files = Dir["README.md", "LICENSE"]
  gem.require_paths    = ["lib"]

  gem.required_ruby_version = ">= 1.9.3"
  gem.add_development_dependency "hexx-rspec", "~> 0.4"

end # Gem::Specification
