class MainController < ApplicationController
  before_action :redirect_if_signed_in, only: %i[ index ]
  before_action :redirect_unless_signed_in, only: %i[ me ]

  def index
    @user = User.new
  end
  
  def me 
    @user = current_user
  end


  private

  def redirect_if_signed_in
    if user_signed_in?
      redirect_to "/me" 
    end
  end

  def redirect_unless_signed_in
    unless user_signed_in?
      redirect_to "/" 
    end
  end



end
