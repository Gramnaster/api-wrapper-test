
require "net/http"
require "uri"
require "json"

module V1
  module Rawg
    class Request
      TOKEN = ENV["RAWG_API_KEY"] # getting env token
      BASE_URL = "https://api.rawg.io/api" # setting a base path

      def self.call(http_method:, endpoint:)
        uri = URI("#{BASE_URL}#{endpoint}?key=#{TOKEN}") # https://api.rawg.io/api/games?key=jshdkfhksdhf&name=manuel%20tinio

        # Initialize HTTP object
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        # Create request based on method
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

        response = http.request(request)
        JSON.parse(response.body)
      end
    end
  end
end
