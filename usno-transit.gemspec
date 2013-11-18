# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usno/transit/version'

Gem::Specification.new do |spec|
  spec.name          = "usno-transit"
  spec.version       = Usno::Transit::VERSION
  spec.authors       = ["Ryan T. Hosford"]
  spec.email         = ["tad.hosford@gmail.com"]
  spec.description   = %q{Consumes USNO resources to return times of rise, set,
    and transit for the major solar system bodies and selected bright stars.
  }
  spec.summary       = %q{Consumes USNO resources to return times of rise, set,
    and transit for the major solar system bodies and selected bright stars.
  }
  spec.homepage      = "http://github.com/rthbound/usno-transit"
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency     "pay_dirt"
end
