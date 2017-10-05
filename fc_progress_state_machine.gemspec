$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fc_progress_state_machine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fc_progress_state_machine"
  s.version     = FcProgressStateMachine::VERSION
  s.authors     = ["Neil Marion dela Cruz"]
  s.email       = ["nmfdelacruz@gmail.com"]
  s.homepage    = "https://github.com/carabao-capital/fc_progress_state_machine"
  s.summary     = "Manages progress state machines"
  s.description = "Manages progress state machines"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "pry-nav"
  s.add_development_dependency "test_after_commit"
end
