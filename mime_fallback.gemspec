$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mime_fallback/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mime_fallback"
  s.version     = MimeFallback::VERSION
  s.authors     = ["Jeff Ching"]
  s.email       = ["ching.jeff@gmail.com"]
  s.homepage    = "http://github.com/avvo/mime_fallback"
  s.summary     = "Format fallbacks for rendering partials"
  s.description = "Allows a rails format to act as a fallback for another format"
  s.license = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.2.5.1"

  s.add_development_dependency "sqlite3"
end
