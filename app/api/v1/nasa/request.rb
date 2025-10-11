
require "net/http"
require "uri"
require "json"

module V1
  module Nasa
    class Request
      BASE_URL = "https://ssd.jpl.nasa.gov/api/horizons_lookup.api"
      BASE_URL_HORIZONS = "https://ssd.jpl.nasa.gov/api/horizons.api"

      # endpoint should be a string like "?sstr=2004%20MN4" or "?sstr=Halley&format=text"
      def self.call_lookup(http_method:, endpoint:)
        uri = URI("#{BASE_URL}#{endpoint}")

        puts "Requesting: #{uri}"
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request_class = case http_method.to_s.downcase
        when "get" then Net::HTTP::Get
        when "post" then Net::HTTP::Post
        when "put" then Net::HTTP::Put
        when "delete" then Net::HTTP::Delete
        else
          raise ArgumentError, "Unsupported HTTP method: #{http_method}"
        end

        request = request_class.new(uri)
        request["Content-Type"] = "application/json"

        begin
          response = http.request(request)
          if response.code.to_i == 200
            begin
              JSON.parse(response.body)
            rescue JSON::ParserError => e
              V1::Nasa::Errors.from_exception(e)
            end
          else
            V1::Nasa::Errors.from_http(response.code.to_i, response.message)
          end
        rescue Timeout::Error, SocketError, JSON::ParserError, StandardError => e
          V1::Nasa::Errors.from_exception(e)
        end
      end
      def self.call_horizons(http_method:, endpoint:)
        uri = URI("#{BASE_URL_HORIZONS}#{endpoint}")

        puts "Requesting: #{uri}"
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request_class = case http_method.to_s.downcase
        when "get" then Net::HTTP::Get
        when "post" then Net::HTTP::Post
        when "put" then Net::HTTP::Put
        when "delete" then Net::HTTP::Delete
        else
          raise ArgumentError, "Unsupported HTTP method: #{http_method}"
        end

        request = request_class.new(uri)
        request["Content-Type"] = "application/json"

        begin
          response = http.request(request)
          if response.code.to_i == 200
            if uri.query&.include?("format=json")
              begin
                JSON.parse(response.body)
              rescue JSON::ParserError => e
                V1::Nasa::Errors.from_exception(e)
              end
            else
              response.body
            end
          else
            V1::Nasa::Errors.from_http(response.code.to_i, response.message)
          end
        rescue Timeout::Error, SocketError, JSON::ParserError, StandardError => e
          V1::Nasa::Errors.from_exception(e)
        end
      end
    end
  end
end
