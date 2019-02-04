class UsersController < ApplicationController
  def show
    @user = User.all
  end
end
