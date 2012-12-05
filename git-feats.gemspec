# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git-feats/version'

Gem::Specification.new do |s|
  s.name          = "git-feats"
  s.version       = GitFeats::VERSION
  s.authors       = ["Chris Knadler"]
  s.email         = ["takeshi91k@gmail.com"]
  s.description   = "git achievements from the command line"
  s.summary       = "git achievements"
  s.homepage      = "https://github.com/cknadler/git-feats"

  s.files       = `git ls-files`.split("\n").reject {|path| path =~ /\.gitignore$/}
  s.test_files  = `git ls-files -- features/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}

  s.require_path = "lib"

  s.add_runtime_dependency "json"
  s.add_runtime_dependency "faraday", "~> 0.8.4"

  s.add_development_dependency "rake",     "~> 10.0.2"
end
