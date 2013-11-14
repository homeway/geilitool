# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geilitool/version'

Gem::Specification.new do |spec|
  spec.name          = "geilitool"
  spec.version       = Geilitool::VERSION
  spec.authors       = ["homeway"]
  spec.email         = ["homeway.xue@gmail.com"]
  spec.description   = %q{A ruby library for advanced extention}
  spec.summary       = %q{There is some new features, such as full ancestors included eigeinclass}
  spec.homepage      = "https://github.com/homeway/geilitool"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
