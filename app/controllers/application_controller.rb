class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
  end
end