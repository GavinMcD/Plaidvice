class SessionsController < ApplicationController
  
  def create
    # the variable below tells us the info about the user that we're given
    # from our twitter authentication. We can use this information to sign
    # in an existing user, or create a new user if they don't have account.
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to users_path, :flash => {:success => "Aloha! (that's Hawaiian for Hello)"}
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to users_path, :flash => {:success => "Aloha! (that's Hawaiian for Goodbye)"}
  end

end
