class ApplicationController < ActionController::API
    before_action :authenticate_request
  
    private
  
    def authenticate_request
      header = request.headers['Authorization']
      token = header&.split(' ')&.last
      begin
        decoded = JwtService.decode(token)
        @current_user = User.find(decoded[:user_id])
      rescue JWT::DecodeError, ActiveRecord::RecordNotFound => e
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
  end