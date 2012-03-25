require "json"

module Trufflepig
  class FeatureList
    def self.load
      JSON.parse File.read("#{File.dirname(__FILE__)}/../../data/features.json")
    end

    def self.build
      caniuse  = JSON.parse File.read("#{File.dirname(__FILE__)}/../../data/caniuse.json")
      patterns = JSON.parse File.read("#{File.dirname(__FILE__)}/../../data/patterns.json")
      features = caniuse["data"]

      patterns.keys.each do |key|
        features[key].merge!({"detection_pattern" => patterns[key]})
      end

      of = File.open "#{File.dirname(__FILE__)}/../../data/features.json", "w"
      of.syswrite caniuse["data"].to_json
      of.close
    end
  end
end
