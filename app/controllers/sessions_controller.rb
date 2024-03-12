class SessionsController < ApplicationController
  def new
  end

  def create
    puts "Params"
    puts authentication_params
    user = User.authenticate_by(email: authentication_params[:email], password: authentication_params[:password]) 
    
    if user 
      login user  
      redirect_to "/me", notice: "You have been logged in"
    else  
      redirect_to root_path, alert: "Invalid email or password"
    end

  end
  
  
  def destroy 
    logout current_user
    redirect_to root_path, notice: "You have been logged out"
  end

  private 

  def authentication_params
    params.require(:user).permit(:email, :password)
  end
end
