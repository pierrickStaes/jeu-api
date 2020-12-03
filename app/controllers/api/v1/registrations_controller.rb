class Api::V1::RegistrationsController < Devise::RegistrationsController
    before_action :ensure_params_exist, only: :create
    skip_before_action :verify_authenticity_token, :only => :create
    # sign up
    def create
      user = User.new user_params
      if user.save
        render json: {
          messages: "Sign Up Successfully",
          is_success: true,
          data: {user: user}
        }, status: :ok
      else
        render json: {
          messages: "Sign Up Failded",
          is_success: false,
          data: {}
        }, status: :unprocessable_entity
      end
    end
  
    private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  
    def ensure_params_exist
      return if params[:user].present?
      render json: {
          messages: "Missing Params",
          is_success: false,
          data: {}
        }, status: :bad_request
    end

    swagger_controller :register, "User register"
      swagger_api :create do
        summary "Create new user with token"
        param :form, :email, :string, :required, "email"
        param :form, :password, :string, :required, "password"
        param :form, :password_confirmation, :string, :required, "password_confirmation"
        response :unauthorized
        response :not_acceptable, "The request you made is not acceptable"
      end
    
end