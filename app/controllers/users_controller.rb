class UsersController < ApplicationController
  # Using CanCan:  https://github.com/ryanb/cancan
  load_and_authorize_resource
  
  # Create is in the User model
  before_filter :authenticate, :only => [:edit, :update, :destroy]
  
  def index
    @users = User.all
    @nugget = Nugget.new
  end
  
  def show
    @user = User.find_by_id(params[:id])
    @nuggets = @user.nuggets
    @nugget = Nugget.new
    if @user == nil
      redirect_to users_path, :flash => {:info => "This person doesn't exist (in Pladvice that is...)"}
    end
  end
  
  def edit
    @user = User.find_by_id(params[:id])
    if @user == nil
      redirect_to users_path, :flash => {:info => "This person doesn't exist (in Pladvice that is...)"}
    end
  end
  
  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => {:success => "Change = success"}
    else
      @title = 'Edit User'
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to nuggets_path, :flash => {:success => "Your account was deleted"}
  end
  
end
