require 'rubygems'
require 'bundler/gem_tasks'
require 'rake'
require 'rake/clean'
require 'rdoc/task'
require 'rspec/core/rake_task'

desc "Clean"
task :clean do
  rm_rf "pkg"
end

desc "Remove ~/.git_feats"
task :clean_feats do
  rm_rf Dir.home + "/.git_feats"
end

desc "Rebuilds the gem for quick testing."
task :rebuild_gem do
  `gem uni git-feats`
  `gem build git-feats.gemspec`
  `gem i git-feats*.gem`
end

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

Rake::RDocTask.new do |rd|
  rd.rdoc_dir = "rdoc_html"
  rd.rdoc_files.include("lib/**/*.rb")
  rd.rdoc_files.exclude('multipart.rb')
end