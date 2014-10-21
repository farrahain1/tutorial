class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
     #session[:user_id] = @user.id
     log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
     # [:error]
      render 'new'
    end
  end
  
  def destroy
    #session.delete(:user_id)
    log_out
    flash[:success] = "Successfully Lpgged out"
    redirect_to root_url
  end
end
