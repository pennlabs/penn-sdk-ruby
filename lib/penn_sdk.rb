require "penn_sdk/version"
require "httparty"

module PennSDK
  class Base
    include HTTParty
    base_uri 'https://esb.isc-seo.upenn.edu/8091/open_data/'

    def initialize(username, password)
      if not username or not password
        raise "Username and password required"
      end
      @username = username
      @password = password
      @headers = {
        "Authorization-Bearer" => username,
        "Authorization-Token"  => password,
        "Content-Type"         => "application/json; charset=utf-8"
      }
    end

    def api(endpoint, query={})
      result = self.class.get(endpoint, query: query, headers: @headers)
      if not result["service_meta"]["error_text"].empty?
        raise result["service_meta"]["error_text"]
      else
        return result["result_data"]
      end
    end
  end

  class Registrar < Base
    ENDPOINTS = {
      :catalog       => '/course_info',
      :search        => '/course_section_search',
      :search_params => '/course_section_search_parameters'
    }

    def course(dept, course_number)
      api("#{ENDPOINTS[:catalog]}/#{dept}/#{course_number}")
    end

    def section(dept, course_number, section_number)
      api(ENDPOINTS[:search], {"course_id" => dept + course_number + section_number})
    end

    def searchParams
      api(ENDPOINTS[:search_params])
    end
  end

  class Directory < Base
    ENDPOINTS = {
      :search  => '/directory',
      :details => '/directory_person_details'
    }

    def search(params)
      api(ENDPOINTS[:search], params)
    end

    def details(person)
      api("#{ENDPOINTS[:details]}/#{person}")[0]
    end
  end

  class Dining < Base
    ENDPOINTS = {
      :venues => '/dining/venues',
      :menus  => '/dining/menus'
    }

    def venues
      api(ENDPOINTS[:venues])["document"]["venue"]
    end

    def daily_menu(venue)
      api("#{ENDPOINTS[:menus]}/daily/#{venue}")["Document"]
    end

    def weekly_menu(venue)
      api("#{ENDPOINTS[:menus]}/weekly/#{venue}")["Document"]
    end
  end

  class Transit < Base
    ENDPOINTS = {
      :stops   => '/transit/stopinventory',
      :config  => '/transit/511/Configuration',
      :predict => '/transit/511/Prediction',
      :arrived => '/transit/511/Arrived'
    }

    def stops
      api(ENDPOINTS[:stops])
    end

    def config
      api(ENDPOINTS[:config])
    end

    def predict
      api(ENDPOINTS[:predict])
    end

    def arrived
      api(ENDPOINTS[:arrived])
    end
  end
end
