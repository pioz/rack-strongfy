# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/strongfy/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-strongfy'
  spec.version       = Rack::Strongfy::VERSION
  spec.authors       = ['pioz']
  spec.email         = ['enrico@megiston.it']
  spec.description   = %q{Wrap specific words with strong tag}
  spec.summary       = %q{Wrap specific words in html with strong tag}
  spec.homepage      = 'https://github.com/pioz/rack-strongfy'
  spec.license       = 'LGPL'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_dependency 'nokogiri', '~> 1.6'
end
