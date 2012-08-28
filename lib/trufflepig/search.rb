module Trufflepig
  class Search
    attr_accessor :results, :path

    EXCLUDED_FILENAMES = /#{%w{
      jquery prototype yui dojo extjs raphael zepto enyo ember modernizr
      bootstrap foundation
    }.join('|')}/

    def initialize(path)
      @results = []
      @path = path
    end

    def perform
      if File.directory?(path)
        Dir.chdir path
        files = {
          :html => Dir.glob(File.join("**", "*.html")),
          :js => Dir.glob(File.join("**", "*.js")),
          :css => Dir.glob(File.join("**", "*.css"))
        }
        files.each do |type, paths|
          paths.each  do |path|
            next if File.directory?(path)
            scan path unless path.split('/').last.match EXCLUDED_FILENAMES
          end
        end
      else
        scan path
      end
    end

    def scan(file_path)
      content = File.read file_path

      features.each do |feature|
        next unless feature["detection_pattern"]
        results << feature if content.match(/#{feature["detection_pattern"]}/)
      end
    end

    private

    def features
      @features ||= FeatureList.load
    end
  end
end
