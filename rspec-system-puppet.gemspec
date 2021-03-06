# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  # Metadata
  s.name        = "rspec-system-puppet"
  s.version     = "2.2.1"
  s.authors     = ["Ken Barber"]
  s.email       = ["info@puppetlabs.com"]
  s.homepage    = "https://github.com/puppetlabs/rspec-system-puppet"
  s.summary     = "Puppet rspec-system plugin"
  s.license     = "Apache 2.0"

  # Manifest
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*_spec.rb`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib", "resources"]

  # Dependencies
  s.required_ruby_version = '>= 1.8.7'
  s.add_runtime_dependency "rspec-system", '~> 2.0'
end
