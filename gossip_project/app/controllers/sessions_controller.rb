class SessionsController < ApplicationController


  def new
  end

  def create
    puts params
    user = User.find_by(email: params["email"])



    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      params["remember_me"] == '1' ? remember(user) : forget(user)
      flash[:notice] = 'Welcome back'
      redirect_to root_path

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

end
