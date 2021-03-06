class PermissionsController < ApplicationController
  before_action :authenticate_user

  def auth_header
    request.headers['Authorization']
  end

  def authenticate_user
    if request.headers['Authorization'].present?
      authenticate_or_request_with_http_token do |token|
        jwt_payload = JWT.decode(token, 'vicSecret', true, algorithm: 'HS256').first

        @current_user_id = jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        render json: { error: "Unauthorized access" }, status: :unauthorized
      end
    end
  end

  def authenticate_user!(_options = {})
    render json: { loggedIn: false, result: [], message: 'Please log in to continue' } unless signed_in?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  rescue StandardError
    # head :unauthorized
  end

  def signed_in?
    @current_user_id.present?
  end

  def user_not_authorized
    if current_user.role.name == "student"
      render json: { error: "You are not authorized to perform this action" }, status: :unauthorized
    else
      action = params[:action]
    end
  end

  def only_admin
    if current_user.role.name == "admin"
      action = params[:action]
    else
      render json: { error: "Only the admin can perform this action" }, status: :unauthorized
    end
  end

  def only_student
    if current_user.role.name == "student"
      action = params[:action]
    else
      render json: { error: "Only the student can perform this action" }, status: :unauthorized
    end
  end
end
