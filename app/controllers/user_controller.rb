class UserController < ApplicationController
  def home
    users = User.all.includes(:qcms).to_a
    render json: users, include: :qcms
  end

  def logged_in?
    render json: [user_signed_in?, current_user]
  end
end
