class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to your profile!"
     redirect_to @user
    else
      render 'new'
    end
  end
  
 
 def index
   if params[:search]
     @user = User.search(params[:search]).order("created_at DESC")
   else
     @user = User.order("created_at DESC")
   end
 end
   
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def filtering_params(params)
    params.slice(:name, :email)
  end
end
