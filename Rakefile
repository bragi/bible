# coding: utf-8
require 'rake/testtask'

namespace :db do
  task :migrate
  task :setup
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

task :default => [:test]
