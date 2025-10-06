module Api::V1::Rawg
  class RawgController < ApplicationController
    def get_creators
      response = V1::Rawg::Client.creators
      render json: response
    end
  end
end
