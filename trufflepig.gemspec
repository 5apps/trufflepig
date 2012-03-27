# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "trufflepig"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sebastian Kippe"]
  s.date = "2012-03-27"
  s.description = "Detects Web platform feature usage in source files"
  s.email = "sebastian@kip.pe"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "data/caniuse.json",
    "data/features.json",
    "data/patterns.json",
    "lib/tasks/featurelist.rb",
    "lib/trufflepig.rb",
    "lib/trufflepig/feature_list.rb",
    "lib/trufflepig/search.rb",
    "spec/dummy_app/css/style.css",
    "spec/dummy_app/index.html",
    "spec/dummy_app/js/app.js",
    "spec/dummy_app/js/jquery.min.js",
    "spec/helper.rb",
    "spec/trufflepig/feature_list_spec.rb",
    "spec/trufflepig/search_spec.rb",
    "spec/trufflepig_spec.rb",
    "trufflepig.gemspec"
  ]
  s.homepage = "http://github.com/5apps/trufflepig"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.19"
  s.summary = "Detects Web platform feature usage in source files"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<purdytest>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.3"])
    else
      s.add_dependency(%q<purdytest>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
    end
  else
    s.add_dependency(%q<purdytest>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
  end
end

