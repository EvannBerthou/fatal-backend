class UserController < ApplicationController
    def home
        render json: User.all
    end

    def logged_in?
        render json: user_signed_in?
    end
end
