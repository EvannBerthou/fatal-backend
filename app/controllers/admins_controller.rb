class AdminsController < ApplicationController
    before_action { |c| redirect_to '/' unless current_user&.admin }

    def show
        render json: current_user
    end
end
