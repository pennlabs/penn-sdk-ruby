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

  describe "menus" do
    it "should have the location for Commons" do
      result = @dining.daily_menu 593
      assert_equal "University of Pennsylvania 1920 Commons", result["location"]
    end

    it "should have multiple meals per day" do
      result = @dining.daily_menu 593
      assert result["tblMenu"]["tblDayPart"].size > 1
    end

    it "should have lots of food stations" do
      result = @dining.daily_menu 593
      assert result["tblMenu"]["tblDayPart"][0]["tblStation"].size > 4
    end
  end
end
