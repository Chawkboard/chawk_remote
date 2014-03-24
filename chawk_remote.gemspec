# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chawk_remote/version'

Gem::Specification.new do |spec|
  spec.name          = "chawk_remote"
  spec.version       = ChawkRemote::VERSION
  spec.authors       = ["Scott Russell"]
  spec.email         = ["queuetue@gmail.com"]
  spec.summary       = %q{A ruby wrapper for the chawk REST api.}
  spec.description   = %q{A ruby wrapper for the chawk REST api.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'multipart-post', '~> 1.1'
  spec.add_dependency 'json'
  spec.add_dependency 'httparty'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '~> 2.6'
  spec.add_development_dependency 'webmock'
end
