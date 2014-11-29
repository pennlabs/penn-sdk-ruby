require "minitest/autorun"
require "penn_sdk"

describe PennSDK::Dining do
  before do
    @dining = PennSDK::Dining.new(ENV["DINING_API_USERNAME"],
                                  ENV["DINING_API_PASSWORD"])
  end

  describe "venues" do
    it "should have hours for venues" do
      result = @dining.venues
      assert result[0].has_key?("dateHours")
    end
  end
end
