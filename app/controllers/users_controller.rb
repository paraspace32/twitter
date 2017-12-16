class UsersController < ApplicationController
  before_action :authenticate_user!

  def count
    @tweets_count = current_user.tweets.count
  end

  def index
    @users = User.all
  end

  def follow
    @check = Follow.where(user_id: current_user.id, following: params[:id]).first

    if @check.nil?
      @following = Follow.create(following: params[:id], user_id: current_user.id)
    else
      render json: { message: 'Already following' }, status: 400
    end
  end
end
