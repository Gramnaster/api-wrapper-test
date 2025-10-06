module V1::Nasa
  class Client
    def self.search(params)
      allowed = params.to_unsafe_h.slice("sstr", "format", "group")
      query = allowed.to_query
      Request.call_lookup(http_method: "get", endpoint: "?" + query)
    end
    def self.horizons(params)
      allowed = params.to_unsafe_h.slice("COMMAND", "format", "EPHEM_TYPE")
      query = allowed.to_query
      Request.call_horizons(http_method: "get", endpoint: "?" + query)
    end
  end
end
