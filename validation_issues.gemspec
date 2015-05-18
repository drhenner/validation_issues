$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "validation_issues/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "validation_issues"
  s.version     = ValidationIssues::VERSION
  s.authors     = ["David Henner"]
  s.email       = ["drhenner@gmail.com"]
  s.homepage    = "http://www.ror-e.com"
  s.summary     = "To ensure Validations that continue to have issues are addressed by developers."
  s.description = "To ensure Validations that continue to have issues are addressed by developers.  This is done by logging the failure.  When a specific failure continues to be an issue, a developer can look into the problem."

  s.files       = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files  = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.6"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
