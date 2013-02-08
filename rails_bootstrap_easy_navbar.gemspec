# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_bootstrap_easy_navbar/version'

Gem::Specification.new do |gem|
  gem.name          = "rails_bootstrap_easy_navbar"
  gem.version       = RailsBootstrapEasyNavbar::VERSION
  gem.authors       = ["Mitchell Lane"]
  gem.email         = ["Mitchell.Lane52@gmail.com"]
  gem.description   = %q{A helper class for creating a simple navigation bar with twitter-bootstrap styling. Navigation bar may only be a maximum of two levels}
  gem.summary       = %q{A helper class for creating a simple navigation bar with twitter-bootstrap styling from a given JSON object}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"

end
