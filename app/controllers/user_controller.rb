class UserController < ApplicationController
    def home
        render json: User.all
    end
end
