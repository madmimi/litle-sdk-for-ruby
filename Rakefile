#!/usr/bin/env rake
require "bundler/gem_tasks"

namespace :test do

  Rake::TestTask.new do |t|
    t.libs << '.'
    t.name = 'unit'
    t.test_files = FileList['test/unit/ts_unit.rb']
    t.verbose = true
  end

  Rake::TestTask.new do |t|
    t.libs << '.'
    t.name = 'functional'
    t.test_files = FileList['test/functional/ts_all.rb']
    t.verbose = true
  end

  Rake::TestTask.new do |t|
    t.libs << '.'
    t.name = 'certification'
    t.test_files = FileList['test/certification/certTest*.rb']
    t.verbose = true
  end
  
  Rake::TestTask.new do |t|
    t.libs << '.'
    t.name = 'all'
    t.test_files = FileList['test/**/*.rb']
    t.verbose = true
  end
  
end