require 'helper'

describe Trufflepig::Search do
  describe "new" do
    before do
      @search = Trufflepig::Search.new dummy_app_path
    end

    it "has an empty result list" do
      @search.results.must_be_empty
    end
  end

  describe "perform" do
    describe "with invalid path" do
      before do
        @search = Trufflepig::Search.new "#{dummy_app_path}/tisnofile"
      end

      it "raises an exception" do
        lambda { @search.perform }.must_raise Errno::ENOENT
      end
    end

    describe "with file path" do
      describe "any file" do
        before do
          @search = Trufflepig::Search.new "#{dummy_app_path}/index.html"
          @search.perform
        end

        it "finds a truffle" do
          @search.results.collect{|f| f["id"] }.must_include "video"
        end
      end

      describe "a well-known JS or CSS lib file" do
        before do
          @search = Trufflepig::Search.new "#{dummy_app_path}/js/jquery.js"
          @search.perform
        end

        it "finds a truffle" do
          @search.results.collect{|f| f["id"] }.must_include "getelementsbyclassname"
        end
      end

      describe "symlinked file" do
        before do
          @search = Trufflepig::Search.new "#{dummy_app_path}/linked.html"
          @search.perform
        end

        it "finds a truffle" do
          @search.results.collect{|f| f["id"] }.must_include "video"
        end
      end
    end

    describe "with directory path" do
      before do
        @search = Trufflepig::Search.new dummy_app_path
        @search.perform
      end

      it "finds a lot of truffles" do
        feature_keys = @search.results.collect{|f| f["id"] }

        feature_keys.must_include "video"         # html
        feature_keys.must_include "stream"        # js
        feature_keys.must_include "css-boxshadow" # css
        feature_keys.must_include "offline-apps"
        feature_keys.must_include "canvas"
      end

      it "doesn't search in well-known JS libs" do
        feature_keys = @search.results.collect{|f| f["id"] }

        feature_keys.wont_include "getelementsbyclassname"
      end
    end
  end
end
