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
end
