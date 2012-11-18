# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foreman-export-nginx/version'

Gem::Specification.new do |gem|
  gem.name          = "foreman-export-nginx"
  gem.version       = Foreman::Export::Nginx::VERSION
  gem.authors       = ["Pete Keen"]
  gem.email         = ["peter.keen@bugsplat.info"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
