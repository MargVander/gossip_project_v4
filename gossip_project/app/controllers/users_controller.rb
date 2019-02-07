class UsersController < ApplicationController
  include SessionsHelper

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(city_id: 11, first_name: params["first_name"], last_name: params["last_name"], email: params["email"], password: params["password"], description: params["description"])
    if @user.save
      flash[:notice] = "User successfully created"
      log_in(@user)
      redirect_to root_path
    elsif @g.errors.any?
      flash[:notice] = "User fail"
      redirect_to new_user_path
    end
  end
end
