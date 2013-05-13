class PagesController < ApplicationController
  def home
  end

  def contact  
    if current_user.email=="fabienlebas@free.fr"
      @subscription = Subscription.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @subscription }
      end
    end
  end

  def about
  end
  
  def howitworksbusiness
  end
  
  def howitworksanticipate
  end
  
  def quickstartguide
  end
  
end
