require "minitest/autorun"
require "penn_sdk"

describe PennSDK::Directory do
  API_USERNAME = ENV["DIRECTORY_API_USERNAME"]
  API_PASSWORD = ENV["DIRECTORY_API_PASSWORD"]

  before do
    @directory = PennSDK::Directory.new API_USERNAME, API_PASSWORD
  end

  describe "person details" do
    it "can fetch details about Adel Qalieh" do
      result = @directory.details "4ad00e45edffd2ec2180673dabf4aace"
      assert_equal "QALIEH, ADEL ", result["list_name"]
    end
  end

  describe "search" do
    it "can search for Alex Wissmann" do
      result = @directory.search({"last_name" => "Wissmann"})
      assert_equal "WISSMANN, ALEXANDER R", result[0]["list_name"]
    end
  end
end
