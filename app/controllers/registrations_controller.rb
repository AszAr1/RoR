class RegistrationsController < ApplicationController
  before_action :redirect_if_signed_in

  def new
    @user = User.new
  end

  def create
    @user = User.new(registration_params)
    if @user.save 
      Category.create(name: "Work", user_id: @user.id)
      Category.create(name: "Leasure", user_id: @user.id)
      Category.create(name: "Personal", user_id: @user.id)
      
      login @user
      redirect_to "/me"
    else 
      redirect_to root_path
    end
  end

  private

  def registration_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def redirect_if_signed_in
    if user_signed_in?
      redirect_to "/me" 
    end
  end

end