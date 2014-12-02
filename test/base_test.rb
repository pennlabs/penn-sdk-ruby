require "minitest/autorun"
require "penn_sdk"

class TestBase < Minitest::Test
  API_USERNAME = ENV["REGISTRAR_API_USERNAME"]
  API_PASSWORD = ENV["REGISTRAR_API_PASSWORD"]

  def setup
    @base = PennSDK::Base.new API_USERNAME, API_PASSWORD
  end

  def test_fetch_acct_101_correctly
    result = @base.api "/course_info/ACCT/101/"
    assert_equal "101", result[0]["course_number"]
  end

  def test_fetch_cis_121_correctly
    result = @base.api "/course_info/CIS/121/"
    assert_equal "121", result[0]["course_number"]
  end

  def test_can_search_for_acct_101
    result = @base.api "/course_section_search?course_id=ACCT101"
    assert_equal "101", result[0]["course_number"]
    assert_equal "ACCT", result[0]["course_department"]
    assert_equal "REC", result[0]["requirements"][0]["value"]
  end

  def test_can_search_for_acct_101_using_params
    result = @base.api "/course_section_search", {"course_id" => "ACCT101"}
    assert_equal "101", result[0]["course_number"]
    assert_equal "ACCT", result[0]["course_department"]
    assert_equal "REC", result[0]["requirements"][0]["value"]
  end

  def test_errors_without_username
    assert_raises(RuntimeError) do
      PennSDK::Base.new nil, "invalid"
    end
  end
end
