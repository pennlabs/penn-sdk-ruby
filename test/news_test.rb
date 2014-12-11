require "minitest/autorun"
require "penn_sdk"

describe PennSDK::News do
  before do
    @news= PennSDK::News.new(ENV["NEWS_EVENTS_MAP_API_USERNAME"],
                             ENV["NEWS_EVENTS_MAP_API_PASSWORD"])
  end

  describe "search" do
    it "should have news relating to Amy Gutmann" do
      result = @news.search "gutmann"
      assert result.size > 10
    end
  end
end
