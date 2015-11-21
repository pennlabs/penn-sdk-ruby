require "minitest/autorun"
require "penn_sdk"

class RegistrarTest < Minitest::Test
  API_USERNAME = ENV["REGISTRAR_API_USERNAME"]
  API_PASSWORD = ENV["REGISTRAR_API_PASSWORD"]

  def setup
    @registrar = PennSDK::Registrar.new API_USERNAME, API_PASSWORD
  end

  def test_course
    result = @registrar.course "CIS", "110"
    assert_equal "110", result[0]["course_number"]
  end

  def test_section
    result = @registrar.section "CIS", "110", "001"
    assert_equal "LEC", result[0]["activity"]
    assert_equal "CIS", result[0]["course_department"]
    assert_equal "CIS 110001", result[0]["section_id"]
    puts result
  end

  def test_search_params
    result = @registrar.searchParams
    assert(result[0]["acceptable_search_url_parameters_map"] != nil)
  end
end
