require "minitest/autorun"
require "penn_sdk"

describe PennSDK::Map do
  before do
    @map = PennSDK::Map.new(ENV["NEWS_EVENTS_MAP_API_USERNAME"],
                            ENV["NEWS_EVENTS_MAP_API_PASSWORD"])
  end

  describe "search" do
    it "should have the Ralston House" do
      result = @map.search({'description' => 'geriatric'})
      assert result[0]["title"] == "Ralston House"
    end

    it "should get all the libraries" do
      result = @map.search({'description' => "library"})
      assert_kind_of Array, result
      assert result.size > 10
    end

    it "should get all the libraries by type" do
      result = @map.search({"building_type_id" => 11033292})
      assert_kind_of Array, result
      assert result.size > 10
    end
  end

  describe "filter parameters" do
    it "should get the list of all building filters" do
      result = @map.params
      assert result.has_key? "asset_type_parameters_map"
      assert result.has_key? "building_type_parameters_map"
      assert result.has_key? "school_parameters_map"
    end
  end
end
