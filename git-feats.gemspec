# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'git_feats/version'

Gem::Specification.new do |gem|
  gem.name          = "git-feats"
  gem.version       = GitFeats::VERSION
  gem.license       = "MIT"  
  gem.authors       = ["Chris Knadler"]
  gem.email         = ["takeshi91k@gmail.com"]
  gem.description   = %q{Complete feats while using git on the command line}
  gem.summary       = %q{Command line git achievements}
  gem.homepage      = "https://github.com/cknadler/git-feats"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "cucumber", "~> 1.2.1"
end
