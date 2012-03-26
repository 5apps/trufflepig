require 'helper'

describe Trufflepig::FeatureList do
  describe "load" do
    before do
      @features = Trufflepig::FeatureList.load
    end

    it "returns a list of features" do
      @features.keys.must_include "video"
      @features.keys.must_include "audio"
      @features.keys.must_include "canvas"

      feature = @features.values_at("video").first
      feature["categories"].must_equal ["HTML5"]
      feature["title"].must_equal "Video element"
    end
  end

  describe "build" do
    before do
      Trufflepig::FeatureList.build
      @features = Trufflepig::FeatureList.load
    end

    it "adds detection patterns to the features" do
      feature = @features.values_at("video").first
      feature["detection_pattern"].must_equal "<video.*>.*<\\/video>"

      feature = @features.values_at("offline-apps").first
      feature["detection_pattern"].must_equal "<html.*\\smanifest=.*>"
    end
  end
end
