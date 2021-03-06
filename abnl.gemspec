# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'abnl/version'

Gem::Specification.new do |spec|
  spec.name          = "ABNL"
  spec.version       = ABNL::VERSION
  spec.authors       = ["Wayne Robinson"]
  spec.email         = ["wayne.robinson@gmail.com"]

  spec.summary       = %q{ABN lookup library for use with http://abr.business.gov.au/Index.aspx}
  spec.description   = %q{ABN lookup library for use with http://abr.business.gov.au/Index.aspx}
  spec.homepage      = "https://github.com/AllMyFunds/abnl"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "http"
  spec.add_dependency "oga"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "pry"
end
