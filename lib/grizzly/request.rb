require 'faraday'
require 'faraday_stack'
require 'json'

module Grizzly
  class Request

    API_VERISON = 2
    BASE_URI = "https://api.weibo.com"
    FORMAT = "json"

    def initialize(method, url, options)
      connection = Faraday.new(:url => BASE_URI) do |builder|
        builder.use Faraday::Adapter::NetHttp
        builder.use FaradayStack::ResponseJSON,     content_type: 'application/json'
        builder.use Faraday::Request::UrlEncoded
      end

      @response = connection.get("/#{API_VERISON}#{url}.#{FORMAT}") do |request|
        options.each do |key, value|
          request.params[key] = value
        end
      end
    end

    def response
      #One day we might want to use XML here. God forbid.
      send "response_to_#{FORMAT}"
    end

    private

    def response_to_json
      payload = JSON.parse(@response.body)
      if payload.has_key?("error") && payload.has_key?("error_code")
        raise Grizzly::Errors::WeiboAPI.new(payload[:error], payload[:error_code])
      end
      payload
    end
  end
end
