# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tel_formatter/version"

Gem::Specification.new do |spec|
  spec.name          = "tel_formatter"
  spec.version       = TelFormatter::VERSION
  spec.authors       = ["iTakeshi"]
  spec.email         = ["takeshi.ito.doraemon@gmail.com"]
  spec.summary       = %q{Format your telephone numbers}
  spec.homepage      = "https://github.com/iTakeshi/tel_formatter"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
