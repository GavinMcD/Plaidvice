class SessionsController < ApplicationController
  
  def create
    # the variable below tells us the info about the user that we're given
    # from our twitter authentication. We can use this information to sign
    # in an existing user, or create a new user if they don't have account.
    request.env["omniauth.auth"]
  end

end
