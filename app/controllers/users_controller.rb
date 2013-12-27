class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by_id(params[:id]) || User.find_by_username(params[:id]) || User.find_by_access_token(params[:id])
  end
end
