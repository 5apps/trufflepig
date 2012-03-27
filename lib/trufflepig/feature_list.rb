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
      output   = []

      # Merge detection patterns into feature list
      patterns.keys.each do |key|
        features[key].merge!({"detection_pattern" => patterns[key]})
      end

      # Transform feature list to an array
      features.each do |key, feature|
        output << feature.merge({"id" => key})
      end

      # Sort array by feature id
      output.sort!{|a, b| a["id"] <=> b["id"] }

      # Write new features file
      of = File.open "#{File.dirname(__FILE__)}/../../data/features.json", "w"
      of.syswrite output.to_json
      of.close
    end
  end
end
