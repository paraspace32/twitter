class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]

  respond_to :html

  def index
    @users = Follow.where(user_id: current_user.id).collect { |k| k.following }
    @tweets = Tweet.where(user_id: @users)
    respond_with(@tweets)
  end

  def show
    respond_with(@tweet)
  end

  def new
    @tweet = Tweet.new
    @tweet.user_id = current_user.id
    respond_with(@tweet)
  end

  def edit
  end

  def retweet
    @retweet = Tweet.create(message: set_tweet.message, user_id: set_tweet.user_id)
  end

  def create
    @tweet = Tweet.new(tweet_params)
    tweet_params.merge(user_id: current_user.id)
    @tweet.save
    respond_with(@tweet)
  end

  def update
    @tweet.update(tweet_params)
    respond_with(@tweet)
  end

  def destroy
    @tweet.destroy
    respond_with(@tweet)
  end

  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:message, :user_id)
    end
end
