require 'helper'

describe Trufflepig::FeatureList do
  describe "load" do
    before do
      @features = Trufflepig::FeatureList.load
    end

    it "returns a list of features" do
      feature_keys = @features.collect{|f| f["id"] }
      feature_keys.must_include "video"
      feature_keys.must_include "audio"
      feature_keys.must_include "canvas"

      feature = @features.select{|f| f["id"] == "video"}.first
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
      feature = @features.select{|f| f["id"] == "video"}.first
      feature["detection_pattern"].must_equal "<video.*>.*<\\/video>"

      feature = @features.select{|f| f["id"] == "offline-apps"}.first
      feature["detection_pattern"].must_equal "<html.*\\smanifest=.*>"
    end
  end
end
