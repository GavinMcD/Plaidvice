class NuggetsController < ApplicationController
  # Using CanCan:  https://github.com/ryanb/cancan
  load_and_authorize_resource
  
  before_filter :authenticate, :only => [:create, :destroy]
  
  def index
    case params[:find_by]
      when 'topic'
        @nuggets = Nugget.where(['topic = ?', params[:topic_name]])
      when 'audience'
        @nuggets = Nugget.where(['audience = ?', params[:audience_name]])
      else
        @nuggets = Nugget.all
    end
    
    @nugget = Nugget.new
  end

  def show
    @nugget = Nugget.find(params[:id])
  end
  
  def create
    @nugget = current_user.nuggets.build(params[:nugget])
    if @nugget.save
      redirect_to @nugget, :flash => {:success => "Your advice is given"}
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
