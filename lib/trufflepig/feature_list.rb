require "json"

module Trufflepig
  class FeatureList
    def self.load
      JSON.parse File.read("#{File.dirname(__FILE__)}/../../data/features.json")
    end

    def self.build
      # read data from caniuse JSON
      caniuse = JSON.parse File.read("#{File.dirname(__FILE__)}/../../data/caniuse.json")

      # Read data from patterns JSON
      patterns = JSON.parse File.read("#{File.dirname(__FILE__)}/../../data/patterns.json")

      # Merge data
      features = caniuse["data"]
      patterns.keys.each do |key|
        features[key].merge!({"detection_pattern" => patterns[key]})
      end

      # Write features to file
      of = File.open "#{File.dirname(__FILE__)}/../../data/features.json", "w"
      of.syswrite caniuse["data"].to_json
      of.close
    end
  end
end
