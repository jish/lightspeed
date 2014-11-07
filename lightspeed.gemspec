Gem::Specification.new do |s|
  s.name        = "lightspeed"
  s.version     = "0.1.0"
  s.licenses    = ["MIT"]
  s.summary     = "A RubyGem to test your HTTP server's performance"
  s.description = "Run some diagnostic tests on your server"
  s.authors     = ["Josh Lubaway"]
  s.email       = "josh.lubaway@gmail.com"
  s.files       = ["lib/lightspeed.rb"]
  s.homepage    = "https://github.com/jish/lightspeed"

  s.add_development_dependency 'autotest-suffix'
end
