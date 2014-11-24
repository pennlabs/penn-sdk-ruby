require "penn_sdk/version"
require "httparty"

module PennSDK
  class Penn
    include HTTParty
    base_uri 'esb.isc-seo.upenn.edu/8091/open_data'

    def initialize(username, password)
      @username = username
      @password = password
      @headers = {
        "Authorization-Bearer" => username,
        "Authorization-Token"  => password,
        "Content-Type"         => "application/json; charset=utf-8"
      }
    end
  end
end
