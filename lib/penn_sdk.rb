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
end
