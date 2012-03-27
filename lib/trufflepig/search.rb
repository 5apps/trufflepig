module Trufflepig
  class Search
    attr_accessor :results, :path

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
          paths.each {|file| scan file }
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
