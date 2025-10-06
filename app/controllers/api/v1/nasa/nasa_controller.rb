module Api::V1::Nasa
  class NasaController < ApplicationController
    def search
      response = V1::Nasa::Client.search(params)
      render json: response
    end
    def horizons
      response = V1::Nasa::Client.horizons(params)
      render json: response
    end
  end
end
