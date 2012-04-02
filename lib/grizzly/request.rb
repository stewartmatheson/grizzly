# encoding: UTF-8

require 'faraday'
require 'faraday_stack'
require 'json'

module Grizzly
  class Request

    API_VERISON = 2
    BASE_URI = "https://api.weibo.com"
    FORMAT = "json"
    TIMEOUT = 5
    OPEN_TIMEOUT = 2

    def initialize(method, url, options, payload = nil) 
      connection = Faraday.new(:url => BASE_URI) do |builder|
        builder.use Faraday::Adapter::NetHttp
        builder.use FaradayStack::ResponseJSON, content_type: 'application/json'
        builder.use Faraday::Request::UrlEncoded
      end

      @response = connection.send(method) do |request|
        request.url "/#{API_VERISON}#{url}.#{FORMAT}"
        request.headers['Content-Type'] = "application/x-www-form-urlencoded"
        request.options = {
          :timeout      => TIMEOUT,
          :open_timeout => OPEN_TIMEOUT
        } 

        options.each do |key, value|
          request.params[key] = value
        end
        
        request.body = to_uri_encoded(payload) if payload
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
        raise Grizzly::Errors::WeiboAPI.new(payload["error"], payload["error_code"])
      end
      payload
    end

    def to_uri_encoded(params)
      URI.escape(params.collect{|k,v| "#{k}=#{v}"}.join('&'))
    end

  end
end
