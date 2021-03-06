# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/opal-rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'guard-opal-rails'
  spec.version       = Guard::OpalRailsVersion::VERSION
  spec.authors       = ['Forrest Chang']
  spec.email         = ['fkc_email-ruby@yahoo.com']
  spec.summary       = 'Guard gem for running specs in opal-rails'
  spec.description   = 'Guard::OpalRails automatically runs your opal specs in rails projects using opal-rails'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.add_dependency 'guard-compat', '~> 1.2'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  # opal spec dir not configurable before this
  spec.add_development_dependency 'opal-rails' # , '>= 0.7.1'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_runtime_dependency 'opal-rails' # , ">= 0.7.1"
end
