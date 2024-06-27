class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:session][:email].downcase)
  
      if user && user.authenticate(params[:session][:password])
        token = JsonWebToken.encode(user_id: user.id)
        render json: { token: token }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
end
