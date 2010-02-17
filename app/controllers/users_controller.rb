class UsersController < ApplicationController
  acts_as_login_controller :allow_signup => true

  redirect_after_login do
    flash[:notice] = "Logged in as #{current_user.email_address}."
    { :controller => "pages", :action => "admin" }
  end
end
