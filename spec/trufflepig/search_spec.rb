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
      before do
        @search = Trufflepig::Search.new "#{dummy_app_path}/index.html"
        @search.perform
      end

      it "finds a truffle" do
        @search.results.must_include "video"
      end
    end

    describe "with directory path" do
      before do
        @search = Trufflepig::Search.new dummy_app_path
        @search.perform
      end

      it "finds a lot of truffles" do
        @search.results.must_include "video"         # html
        @search.results.must_include "stream"        # js
        @search.results.must_include "css-boxshadow" # css
        @search.results.must_include "offline-apps"
        @search.results.must_include "canvas"
      end
    end
  end
end
