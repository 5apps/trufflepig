# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "trufflepig"
  gem.homepage = "http://github.com/5apps/trufflepig"
  gem.license = "MIT"
  gem.summary = %Q{Detects Web platform feature usage in source files}
  gem.description = %Q{Detects Web platform feature usage in source files}
  gem.email = "sebastian@kip.pe"
  gem.authors = ["Sebastian Kippe"]
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'spec'
  test.pattern = 'spec/**/*_spec.rb'
  test.verbose = true
end

Dir[File.dirname(__FILE__) + '/lib/trufflepig/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/lib/tasks/*.rb'].each {|file| require file }

task :default => :test
