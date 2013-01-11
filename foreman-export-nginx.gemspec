# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "foreman-export-nginx"
  gem.version       = '0.0.17'
  gem.authors       = ["Pete Keen"]
  gem.email         = ["pete@bugsplat.info"]
  gem.description   = %q{Export Nginx configs using Foreman}
  gem.summary       = %q{Export Nginx confguration files using Foreman}
  gem.homepage      = "https://github.com/peterkeen/foreman-export-nginx"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("foreman")
end
