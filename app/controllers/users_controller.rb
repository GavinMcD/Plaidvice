class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = User.find(session[:user_id]) unless User.find(session[:user_id]) == nil
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit User"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => {:success => "Change = success"}
    else
      @title = 'Edit User'
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, :flash => {:success => "Your account was deleted"}
  end
  
end
