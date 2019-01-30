class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def render_404
    render json: {status: 400, message: "Invalid token"}, status: 400
  end
end
