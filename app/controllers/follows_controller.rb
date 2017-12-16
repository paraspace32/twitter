class FollowsController < ApplicationController
  before_action :set_follow, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @follows = Follow.all
    respond_with(@follows)
  end

  def show
    respond_with(@follow)
  end

  def new
    @follow = Follow.new
    respond_with(@follow)
  end

  def edit
  end

  def create
    @follow = Follow.new(follow_params)
    @follow.save
    respond_with(@follow)
  end

  def update
    @follow.update(follow_params)
    respond_with(@follow)
  end

  def destroy
    @follow.destroy
    respond_with(@follow)
  end

  private
    def set_follow
      @follow = Follow.find(params[:id])
    end

    def follow_params
      params.require(:follow).permit(:following, :user_id)
    end
end
