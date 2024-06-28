class ApplicationController < ActionController::API
  before_action :authenticate_request
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from JWT::DecodeError, with: :handle_jwt_decode_error
  private

  def authenticate_request
  end

  def record_not_found(exception)
    render json: { error: 'Record not found' }, status: :not_found
  end

  def handle_jwt_decode_error(exception)
    render json: { error: 'Invalid token' }, status: :unauthorized
  end
end