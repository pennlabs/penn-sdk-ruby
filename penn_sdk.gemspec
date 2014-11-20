# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'penn_sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "penn_sdk"
  spec.version       = PennSDK::VERSION
  spec.authors       = ["Adel Qalieh"]
  spec.email         = ["aqalieh95@gmail.com"]
  spec.summary       = %q{A Ruby wrapper for the Penn OpenData APIs.}
  spec.description   = %q{A Ruby wrapper for the Penn OpenData APIs. APIs supported will include registrar, directory, dining, transit, maps, events, and news.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
