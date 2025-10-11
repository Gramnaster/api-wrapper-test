class ApplicationController < ActionController::API
  def route_not_found
    render json: { code: 404, status: "Not Found", data: "No route matches" }, status: :not_found
  end
end
