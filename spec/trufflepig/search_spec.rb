require 'helper'

describe Trufflepig::Search do
  describe "new" do
    before do
      @search = Trufflepig::Search.new("#{File.dirname(__FILE__)}/../dummy_app")
    end

    it "has an empty result list" do
      @search.results.must_be_empty
    end
  end
end
