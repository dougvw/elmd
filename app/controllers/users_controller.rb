class UsersController < ApplicationController
  acts_as_login_controller :allow_signup => true

  redirect_after_login do
    flash[:notice] = "Logged in as #{current_user.email_address}."
    { :controller => "pages", :action => "admin" }
  end
  
  def create
    @user = User.new(params[:user].merge(:role_id => 2, :active => true))

    if @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to(root_path)
    else
      @user = User.new
      render :action => "new"
      #redirect_to(signup_path)
    end
  end
  
end
