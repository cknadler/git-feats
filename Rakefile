require 'bundler/gem_tasks'
require 'cucumber/rake/task'

desc "Run features"
Cucumber::Rake::Task.new(:features)

desc "Clean"
task :clean do
  rm_rf "pkg"
end

task :default => :features
