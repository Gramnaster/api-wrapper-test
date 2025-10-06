module V1::Rawg
  class Client
    def self.creator_roles
      Request.call(http_method: "get", endpoint: "/creator-roles")
    end

    def self.creators
      Request.call(http_method: "get", endpoint: "/creators")
    end

    def self.games
      Request.call(http_method: "get", endpoint: "/games")
    end
  end
end
