module V1::Nasa
  class Errors
    def self.from_exception(e)
      case e
      when Timeout::Error
        error_hash("timeout", "The request to the NASA API timed out.", 408)
      when SocketError
        error_hash("network", "A network error occurred while connecting to the NASA API.", 503)
      when JSON::ParserError
        error_hash("parse", "The response from the NASA API could not be parsed as JSON.", 500)
      else
        error_hash("unknown", e.message, 500)
      end
    end

    def self.from_http(code, message)
      case code.to_i
      when 401
        error_hash("http", "NASA API returned status 401: Authorised request.", 401)
      when 404
        error_hash("http", "NASA API returned status 404: Not Found.", 404)
      else
        error_hash("http", "NASA API returned status #{code}: #{message}", code.to_i)
      end
    end

    def self.error_hash(type, message, code)
      {
        error: {
          type: type,
          message: message,
          code: code
        }
      }
    end
  end
end
