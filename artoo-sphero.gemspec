# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "artoo-sphero/version"

Gem::Specification.new do |s|
  s.name        = "artoo-sphero"
  s.version     = Artoo::Sphero::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ron Evans", "Adrian Zankich", "Mike Ford", "Tobias Pfeiffer", "Edgar Silva"]
  s.email       = ["artoo@hybridgroup.com"]
  s.homepage    = "https://github.com/hybridgroup/artoo-sphero"
  s.summary     = %q{Artoo adaptor and driver for Sphero robot}
  s.description = %q{Artoo adaptor and driver for Sphero robot}

  s.rubyforge_project = "artoo-sphero"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'artoo', '>= 1.6.7'
  s.add_runtime_dependency 'sphero', '>= 1.5.1'
  s.add_development_dependency 'minitest', '>= 5.0'
  s.add_development_dependency 'minitest-happy'
  s.add_development_dependency 'mocha', '>= 0.14.0'
end
