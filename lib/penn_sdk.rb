require "penn_sdk/version"
require "httparty"

module PennSDK
  class Base
    include HTTParty
    base_uri 'https://esb.isc-seo.upenn.edu/8091/open_data'

    def initialize(username, password)
      @username = username
      @password = password
      @headers = {
        "Authorization-Bearer" => username,
        "Authorization-Token"  => password,
        "Content-Type"         => "application/json; charset=utf-8"
      }
    end

    def api(endpoint, query={})
      self.class.get(endpoint, query: query, headers: @headers)
    end
  end

  class Registrar < Base
    ENDPOINTS = {
      :catalog       => 'course_info',
      :search        => 'course_section_search',
      :search_params => 'course_section_search_parameters'
    }

    def course(dept, course_number)
      api("/#{ENDPOINTS[:catalog]}/#{dept}/#{course_number}")
    end

    def section(dept, course_number, section_number)
      api(ENDPOINTS[:search], {"course_id" => dept + course_number + section_number})
    end

    def searchParams
      api(ENDPOINTS[:search_params])
    end
  end
end
