# frozen_string_literal: true

# Application API Controller
class ApplicationController < ActionController::API
  def not_found
    render json: { error: 'Route does not exist' }, status: :not_found
  end

  def ensure_authenticated
    header = request.headers['Authorization']&.split&.last

    begin
      user_id = AuthToken.decode header

      @current_user = User.find user_id
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.to_s }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { error: e.to_s }, status: :unauthorized
    end
  end
end
