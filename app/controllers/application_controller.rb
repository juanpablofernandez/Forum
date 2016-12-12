class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def check_admin!
        redirect_to :back, notice: 'You dont have enough permissions to do that.' unless current_user.try(:admin?)
    end

    def check_user!
        redirect_to "/users/sign_in", notice: 'You need to be logged in to do that.' unless user_signed_in?
    end

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
        def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end
end
