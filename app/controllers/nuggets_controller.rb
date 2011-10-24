class NuggetsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  
  def index
    @nuggets = Nugget.all
    @nugget = Nugget.new
  end

  def show
    @nugget = Nugget.find(params[:id])
  end
  
  def create
    @nugget = current_user.nuggets.build(params[:nugget])
    if @nugget.save
      redirect_to nuggets_path, :flash => {:success => "Your advice is given"}
    else
      redirect_to nuggets_path, :flash => {:error => "Please try that again"} 
    end
  end

  def destroy
    @nugget = current_user.nuggets.find(params[:id])
    if @nugget.destroy
      redirect_to nuggets_path, :flash => {:success => "Your advice is gone"}
    end
  end

end
