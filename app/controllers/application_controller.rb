class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def check_admin!
        redirect_to :back, notice: 'You dont have enough permissions to do that.' unless current_user.try(:admin?)
    end

    def check_user!
        redirect_to "/users/sign_in", notice: 'You need to be logged in to do that.' unless user_signed_in?
    end
end
